---
title: "You're All 100x Engineers Now. What? — Karla Burnett (Lorikeet)"
date: 2026-05-30T00:00:00Z
draft: false
key_quote: "Six months ago, we would never have used the term bespoke for writing code by hand. It was like, artisanal code, right? But that's what it feels like these days."
slug: "karla-burnett-lorikeet"
---

<iframe width="560" height="315" src="https://www.youtube.com/embed/eZBIuo8RZ18?si=p56CdQGPH-icsvY3" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

<div id="buzzsprout-player-19084915"></div><script src="https://www.buzzsprout.com/1687069/episodes/19084915-staffeng-with-karla-burnett-you-re-all-100x-engineers-now-what.js?container_id=buzzsprout-player-19084915&player=small" type="text/javascript" charset="utf-8"></script>

Karla Burnett joins Alex and David from Sydney, where she's been building security-conscious AI workflows at [Lorikeet](https://www.lorikeetcx.ai/), a customer service automation company. Karla is Lorikeet's security-focused engineer, working part-time while raising young kids, and she brings a practitioner's eye to how AI is changing not just what gets built but how teams operate safely at speed.

**Hosts:** Alex Kessinger & David Noël-Ramos

**Guest:** Karla Burnett — Staff Engineer at Lorikeet ([@tetrakazi](https://x.com/tetrakazi))

## The Aha Moment

Karla's trajectory from "mildly impressed" to genuinely floored ran through three stages. First: watching LLMs actually produce useful customer service responses when given the right orchestration — something that hadn't clicked before. Second: Cursor's multi-paragraph code completion saving her real keystrokes. Third, and most radical: using frontier models for full security audits, watching them surface vulnerabilities she never would have had time to find manually, and then watching them fix those vulnerabilities automatically.

## The Velocity Czar

As an AI-focused company, Lorikeet moved quickly from "feel free to use Cursor" to "this fundamentally changes how we work." The turning point around December–February brought real anxiety — engineers asking whether they still had jobs — which leadership addressed head-on.

One pattern that worked: appointing a **velocity czar**, a person whose dedicated job is to track the latest AI tooling developments, vet them, and push what's working to the rest of the company. In a small org, most of the diffusion happens socially (a dedicated Slack channel), but it also flows technically — updates to `CLAUDE.md`, skills files, and agents config get tagged and announced when practices change.

## Conductor vs. Superset

Karla's daily driver is [Conductor](https://conductor.build), not raw Claude Code. The key differentiator: a sidebar showing all open worktrees, what each is doing, and which ones need attention — a lightweight orchestration layer for parallel long-running tasks.

Her parallel work style: kick off a security audit across the entire codebase in one worktree, run fixes for a different class of problem in several others, and let the sidebar surface what needs a human decision. [Superset](https://supersetapp.com) is a close competitor with a more terminal-forward interface; Conductor leans chat-first. Neither is perfect — Conductor marks PRs as "done" the moment they merge, which she finds premature given that deployment and monitoring are still live work.

## Testing a Non-Deterministic Product

Lorikeet's product is inherently non-deterministic (LLM-generated customer service responses), which makes testing hard. Their approach:

- **Eval tests** on merge to main — a small suite that actually calls the API, checks that a demo flow (e.g., booking an appointment) still succeeds end to end. Expensive, but it catches the most egregious regressions.
- **Simulations** — LLMs talking to LLMs, where a user persona tries to accomplish a task and a frontier model evaluates whether the outcome met the customer's goals. Useful for testing guardrails without trying to force determinism onto a system that never will be.

The Coach product inside Lorikeet lets her diagnose ticket failures iteratively: describe the bad outcome, get a root cause, propose a fix, rerun simulations, and add new test cases — all in a loop.

## MCP Security: The Biggest Risk Nobody's Talking About

Karla's clearest concern for engineering organizations right now: the MCP server model silently connects previously isolated sensitive systems (secret managers, production databases, Slack) in a way that's easy to overlook.

Even a well-intentioned agent can accidentally route secrets through Slack or turn off row-level security because it makes the immediate task easier. The permission prompts that Claude Code generates get clicked through reflexively. Conductor's `--dangerously-allow-all` mode turns them off entirely.

Her mental model: treat the agent like a very enthusiastic junior engineer who will absolutely help you ship fast, but won't notice the externalities. The right question is: *what would I put in place if I wasn't scared of what this person could do?*

Practical mitigations she's found useful:
- Encrypt secrets at an additional layer so even database access doesn't expose them
- Read-only MCP server hints (acknowledged to be hints only, not enforces)
- Restrict which tools are mounted to agents that don't need them

## Paved Roads in `CLAUDE.md`

Rather than hoping people discover security best practices organically, Lorikeet encodes them as paved roads in their agents config. Examples:

- If you want to host customer data, here's the approved template — and here's why you need an engineer involved the first deploy.
- Row-level security on the database is on by default; don't turn it off just because it makes development faster.
- When shipping analytics data to a third party, pause and confirm it's intentional.

The agent has actually caught violations in practice — flagging extra analytics data being sent to a vendor during a demo build. The key insight: the agent will try to help you solve your problem as fast as possible. It's your job to encode the constraints that should travel with that help.

## Skills: Superpowers and the Emerging Ecosystem

The [Superpowers](https://github.com/nicholasgasior/superpowers) Claude Code plugin is Lorikeet's most widely used external skill. Its core loop: turn a vague task into questions, draft a design doc, break that into an implementation plan, then launch sub-agents for each stage in parallel. Karla's addition: after a long-running task completes, she opens a fresh chat in the same worktree and asks it to compare the design doc against what was actually built, then fix any gaps.

For security audits, the flow is more manual: audit, write findings to a Notion doc, validate each finding with a proof-of-concept in a new context, create Linear tasks for confirmed vulnerabilities, then fix in parallel sub-agents.

Karla's observation on skills authorship: LLMs are better at writing skills than humans are, because humans have almost no practice and the models have at least some training data. Her process — describe what you want, have the model write it, edit in partnership.

## How Much Code Are You Writing?

Karla joined a startup specifically to write more code. She's writing more code than ever — she just isn't typing it. What she does instead: manages a parallel team of agents doing implementation, reviews more code than she writes, and monitors deployments more carefully than before.

The telling moment: a candidate's Conductor session broke mid-interview, forcing them to write code by hand. The reaction in the room: *you wrote code — like, real bespoke code.* Six months earlier nobody would have called it bespoke. Now it's artisanal.

## Links

- **Karla Burnett** — [x.com/tetrakazi](https://x.com/tetrakazi)
- **Lorikeet** — [lorikeetcx.ai](https://www.lorikeetcx.ai/)
- **Conductor** — [conductor.build](https://conductor.build)
- **Superpowers** — Claude Code skills plugin

## Transcript

*Note: This transcript was generated using automated transcription and may contain errors.*

Alex (00:01.242)
Hey everyone, welcome back to the Staff Ends podcast. I'm Alex, I'm here with David.

DNR (00:06.862)
Hey everybody.

Alex (00:08.492)
And we have another guest here, Carla. Carla, would you like to introduce yourself?

Karla (00:14.112)
Hey, yeah, my name's Carla. I live in Sydney. I have young kids. I work at a company called Laura King's, which does customer service automation. So when you write into a company, the automatic responses that you might get back from an AI, but trying to make them actually useful rather than just summaries of what you could already find on the website. Yeah.

Alex (00:35.954)
Awesome. So one of the questions we love to just start off with is, you know, thinking back, like, do you remember any early experiences you were having with LLMs or AIs that really sort of like opened your eyes to the possibilities?

Karla (00:52.184)
Yeah, think there are a couple of moments that stand out. Probably one of the earlier ones was obviously like working at an AI company I joined maybe two years ago. So it was like starting to see like, oh, this could actually be used for something useful. I'd seen, you know, all the like type ahead sort of style stuff when I was working at my previous company when I was at Stripe. But I hadn't been particularly impressed by it. And then I think I started to see like, oh, this is actually capable of with the right harness with the right orchestration, actually creating useful responses.

Then a little bit into my time there seeing, know, cursor launch and actually have quite useful type ahead, like multiple paragraphs of useful type ahead. Actually, wow, this is really saving me a lot of keystrokes. And then most recently working with like the latest frontier models being like, I can actually do like full on security analysis with this. My background is more in security engineering and seeing it like find vulnerabilities that I would never have had the time to investigate. Seeing it fix those automatically. Those I think have been some of the more radical points for me.

Alex (01:50.746)
Amazing.

DNR (01:51.094)
like the organizational implications. part of the reason I'm really looking forward to this chat is because you mentioned it yourself, working at an AI company, sort of probably been forced to grapple with some of this stuff earlier than our peers in companies where the product isn't sort of AI-centric. And so I suspect you're probably also a little bit further ahead in the curve of like

operationalizing some of this AI stuff internally. I'm curious sort of what that journey has looked like for Lorikeet as a company and sort of, yeah, the impacts to your day-to-day in particular.

Karla (02:37.893)
Yeah, I mean, I think early on it was just like early adoption of tools, right? Like a lot of pushing of like, like we've got cursor, let's everyone use cursor as much as we can. And then I think especially since maybe the start of this year, it's been a lot more radical and that it's like, okay, like everyone really needs to be using these tools. Now this is no longer just like, you can save yourself some keystrokes. This is like, this fundamentally changes the way we work.

Alex (02:50.24)
Thank

Karla (03:00.312)
And think especially in like, maybe January, little bit late December, a little bit early February, there was actually like a lot of angst around it internally, right? People feeling like, you know, do I have a job anymore? Right? Like if I write code, but now the AIs can write code for me, what does that mean? And so I think there was a lot of like, both from leadership and maybe from more senior engineers, like handholding, explaining like, this is how this changes our job, but you know, we still have an important role to play. And sort of working to help make sure that everyone was on the

same page in terms of the tools that exist and the practices that you should be using. think one thing that we did particularly well is, and this is probably because we're an AI focused company, our CEO appointed someone as the velocity czar. It's the person whose job it is to learn about the latest AI trends, figure out, test them, maybe with one or two other people, see if they're good, and then try to push those practices out to the entire rest of the company so that everyone can keep up to date with the changes.

DNR (03:54.67)
think that's a pretty healthy pattern because it's obviously like a full-time job at this point just to keep up. mean, maybe not even for one person. Like there's so much happening all the time that I think one of the really tricky things about getting any work done these days is like finding that balance between not falling behind, also like doing the non-research thing that you're like supposed to be doing. And so it's nice to have sort of someone who's delegated to that.

Karla (04:19.415)
Right.

DNR (04:24.268)
What's the process for sort of like, you you mentioned sort of as an example, shifting from like, people can use cursor to like, people really ought to be using cursor. What's the process for sort of like, I guess, promoting that shift internally?

Karla (04:47.256)
Yeah, I mean, we have like a Slack channel where we sort of announce things that we would recommend. I would actually say, for example, like these days we don't use cursor. That's like, we mostly don't write code by hand, right? So these days it would be more of a debate about like which particular flavor of codecs or Claude code orchestration you like to use, right? Would you rather use conductor or superset or just use it natively? And there's a lot of discussion in a Slack channel we have dedicated to this about like, what is the exact pattern that you put you in particular like to use? I think it's just like something that

comes up a lot. It's like very much a topic that's top of mind for a lot of people. And luckily we are a small company. So we do tend to push changes out, I think probably more socially than via any sort of like formal process, other than saying like there's a Slack channel, follow the Slack channel for like the latest and greatest hits, I guess.

I guess also to be fair, also have things like we update like CloudMD or agents of D and like skills files, like other things like that that technically do share things across the repo, right? And they'll like tag people, be like, hey, we've updated the guidance, for example, to be like right more factually and less persuasively in technical design documents, things like that. So to a certain extent, it's social and to a certain extent, I guess we push it out technically as well.

Alex (05:57.213)
There's so many things in there. So you mentioned Conductor and SuperSET. Could you tell us a little bit more about those tools and how people are using them in their day-to-day work?

Karla (06:11.318)
Yeah, for sure. So for me personally, I use Conductor. What it offers over say like raw code or codecs is essentially for me at least two things. One, it makes it much easier to manage work trees. So sort of it's got a side panel. You can have multiple different work trees on the same Git repo open at once doing different things. You can have multiple sessions per each work tree.

that for me is very powerful because it allows me to work on a lot of features in parallel, right? So I'll like kick off some very long running tasks like, I want to audit the entire code base for this type of vulnerability. In another workflow or work tree, I might say like, okay, like go and look at this linear project, find all the tasks that are in this particular category, go and create a PR for each one of them that addresses the issue that's there, write tests, et cetera. And so I find that that...

is very difficult to do for me personally in lots of different tabs of code code because I forget which one is which and where are they up to, which ones need input at any given point in time. And so I personally find the on the sidebar orchestration that Conductor offers very helpful because it's sort of like you've got a list of what each work tree is doing and then an indicator of whether or not it needs your attention at that point in time. Superset is a very similar product.

The primary difference between the two, think, is that superset assumes that you want a terminal-forward interface still, whereas Conductor is more of like, I just want to chat to something. So it might be more like the web app experience that you would have with Cloud or ChatGPT. For me, personally, I was never a huge Vim user. Like, I can use Vim. It wasn't my IDE of choice. And so I personally prefer the chat-style interface rather than a terminal, but that's very much a me thing. And I wouldn't say I love Conductor. Like, I actually think there are many things about it that I dislike. It's quite slow sometimes.

for example, but I think that the benefits it offers over the drawbacks it has make it worthwhile for me.

Alex (07:59.187)
How have you felt about dealing with multiple long-running processes? I'm hearing more and more of people who are sort of dealing with the load of now jumping from project to project. Is that something you're feeling? Is there any sort of techniques that you're using to manage that overload at all?

Karla (07:59.96)
Yeah, I think definitely trying to, trying not to work on things that involve like lots and lots of context switching is something that I found helpful. So it's okay to have lots of things on the go, but maybe they're all related to one particular concept. So like for me, if I'm doing a security audit, it'll be like, okay, in this tab, I'm doing an audit of these things. And then all of these tabs, well, I guess work trees, all of these work trees are working on like fixes for this other style of problem, right?

I do definitely find these days it's like, okay, what I actually spend a lot of time trying to think hard about is like how to deploy code safely, right? How to, correctness is maybe a little bit easier with security stuff sometimes, because it's like if your existing tests still work, things probably are okay-ish, right? But how do I roll this out safely in that like, they're gonna be okay-ish, tests will probably pass, but that doesn't mean that I can just turn it to 100 % in ASU, everything is fine, right? So spend a lot of time trying to remember like,

which feature flags are in which state and like, what exactly do I need to monitor for this feature flag to know that I haven't broken everything as a result? Especially challenging because obviously we have a very non-deterministic product, right? So it's like, if you just change a prompt to make it more secure, but then now you have lower quality responses, verifying that you have changed the quality of responses can be quite challenging. And so I've like started having basically like a little document that I have open on the side of like, here are all of the feature flags and here is like the key log line to look for.

And here is the current rollout state. And then I sort of like keep that up to date at the same time. I've actually put it in a Notion doc now because that way someone else can help me roll it out. I'm not at work five days a week. And so having someone else who can bump a flag for me and know what to look for is quite useful. But I actually wish I had a little bit more process around like how do I manage that deployment step a little bit better. And that's actually something I would say is one of Conductor's weaknesses. As soon as you merge the PR, it moves the chat to a done category. And I'm like, it's not done. It's just merged. That's a very different thing.

DNR (10:09.742)
The sort of like non-deterministic product I think is also pretty rapidly morphing into like, know, effectively, you know, non-deterministic CI processes or non-deterministic automated review tooling and stuff like that.

What have you all learned about managing non-deterministic pipelines that you think might be applicable for folks who are trying to figure out how to do this inside of companies that haven't had to grapple with sort of non-deterministic product area previously?

Karla (10:59.703)
Yeah, we have a couple of strategies.

So one thing we have for just basic testing, like fundamental catch if you break absolutely everything, is we have eval tests. traditionally, you wouldn't try to have tests that hit a third party in your test suite. But we found that we would break our most basic sales demos so often that we were like, OK, we just need to have very basic tests. So they're like, call the sales, the flow that we would expect for a demo account, basically.

and they check that it's trying to make an appointment. Does it get back a date that was available? Does it get back a response that says, yes, you can book the appointment, essentially? Because even that, turns out, is quite easy to break. Prompts are very fragile, I would say. And so we added that, and we run those on mergers to main. And so we pay a cost in terms of time, because we're running a new test suite. It's an expense as well. I guess it's not a free API to call.

But certainly in terms of minimizing breakages is helpful. Obviously that only catches the most egregious errors, right? Of like you completely failed to check that this didn't break a very simple flow. For our actual customers, offer a, we have as part of our product simulations, right? Where we basically have like, okay, like take on this persona and then you've got like the LLMs talking to the LLMs, right? So it's like, if you like have a process that you want to test and it's non-deterministic, the best way to test it is to add more non-determinism, right? But essentially it allows you to have sort of like a more human flow.

And they are very useful, right? Because it allows you to say things like I've actually been doing some development of security stuff in the product and allows you to do things like test, like, okay, like I added this guardrail for say prompt injection, right? Like go through and hold a normal conversation and check, have an LLM evaluate, like did the conversation proceed as a user would expect, right? And it sort of allows you to take a step back and rather than trying to add a lot of determinism onto a process that will never be deterministic,

Karla (12:53.238)
Instead be like, okay, what are the actual goals? What is the thing I'm trying to evaluate? Maybe I just have a frontier model, like something with a decent amount of intelligence, right? Know what my goals are that evaluate whether that process achieved those goals, essentially. I think that's the best that we've come up with, but definitely if other people have great advice, I would love to hear it. I think it's a developing space.

Alex (13:13.606)
Have you ever read anything about the company called Strong DM?

Karla (13:19.263)
No, I haven't heard of them.

Alex (13:20.87)
They, so it sounds like they've done something similar, where they, like it sounds like they build a fake harnesses, like Slack, like a fake Slack and they have agents speak to each other inside of a fake Slack and it represents their customer base. anyways, it's just what, if you haven't heard about it, like, you know, there's like, what I love is it's like, it's convergent evolution, right? You both sort of like showed up at the same space, which I think shows that like,

Karla (13:30.488)
Mm-hmm.

Karla (13:45.464)
Right.

Alex (13:51.177)
It seems like there's a pattern developing here of like basically it's like just make sure like I understand you're doing you're like giving the LLM almost like a persona of your user or a user of your user and your user and you're saying okay go go use the product try to you know make sure that you felt like you had a good transaction with us or something like that is that something is that what you're doing

Karla (14:13.565)
Yeah, yeah, so we would have like a workflow defined which might be like, here is the, here's how you book a flight or here's how you like make a reservation. And then you'd say like, here's a user and they wish to book a flight or make a reservation on this day. And then you can mock out the backing tools and be like, no, that that reservation is not available. And maybe you add the personas that they could also do this other day if they have to, and then check that they are able to, as you say, get to an actual like workable solution for that customer.

where they actually booked, maybe not on their preferred day, but on a day that was available.

Alex (14:40.88)
That's amazing. I think it's really interesting way to sort of like approach the problem. I'm wondering like, have you done any investigations into sort of like when a thing like that doesn't work? You know, like have you found a way to sort of push the quality of that type of tool at all?

Karla (15:01.612)
Yeah, I mean, think it's still something we're working on pretty intensely. In terms of pushing the quality, we have sort of like an agent style harness within our product. So almost like talking to Claude Coat, but instead it's now like able to configure our product. And honestly, working iteratively with that is pretty useful. Cause like you basically like, can run these simulations, then you're like, but this one ticket didn't do what I want, right? You go into this product we have called Coach.

So like, hey, help me diagnose why this ticket did the wrong thing. And it'll go through and be like, OK, this happened because this thing was wrong. They're like, great, how do I fix it? Kind of thing. And it'll be like, you could update the guardrails for this, or you could update the workflow. It will suggest whichever thing makes sense. Make the update for you, rerun simulations, add a new simulation for that. And I think that sort of iterative process is probably the best thing that we've got for that right now. But I think that sort of having the LLM, the LLM prompts for the LLM, sort of like if you just add more layers on.

you get some pretty impressive insights as a result of it.

Alex (15:58.781)
So in that world, imagine a ticket represents an interaction with a customer. And so you have this whole history, I imagine, between your agent and the customer. When you have it explain what it did or try to assess, are you also giving it what you asked some sort of LLM on the back end and the response you got back from that LLM so that it can diagnose with the full picture in mind?

Karla (16:04.812)
Yep, correct.

Karla (16:28.126)
Yeah, it doesn't get all of the details, right? Like obviously we've got system logs that go into like specifically exactly what prompted we sent. I don't believe it gets that information. It does get like, hey, this was the workflow that you were running, right? So I guess it's missing the like stuff we might add around the outside to give the context of like maybe the our users or our subscriber might have a workflow configured for making appointment. It's missing the like.

prefix and suffix style stuff that we might add to that workflow to explain like, hey, you're acting in this context. But it has all of the sort of like variables that go into that. So it's got like, here's the brand guidelines, here's the context for what this business is, here's the workflow that it's running. It's got all of the events. So it sees like every tool that's called. It sees the guard rails that might trigger. So we have like steering guard rails. So maybe when it generates a response, it's like, actually that was too uncertain sounding.

So will go back to the LLM and add extra things being like, make sure that you don't sound uncertain, right? And then come back. And so it can see all of those events and see, you know, whether or not a guardrail is incorrectly triggering. One I've been dealing with is like, yeah, this uncertain one is kind of like, where's the line of uncertainty if something goes wrong? If it's like, I think something might have broken. Is that too uncertain for a support agent is an interesting question. That's very business specific. So sort of customizing that and saying like, no, you said this was too uncertain. I disagree, right? Like make it so that this guardrail is less sensitive.

And it's able to iterate on that, add new simulations, right? Like it'll add those cases for you automatically run them, generally iterate that way.

DNR (17:47.022)
Hmm.

DNR (17:57.452)
You've mentioned security sort of tangentially. mean, it's clearly an area of focus for you specifically, and we've been kind of poking around it at other things. But I do think that the implications of introducing LLMs into the workplace obviously come with unique security constraints. I also think that it's possible that right now, given the, I think, FOMO, that a lot of

tech leaders are facing around LLMs, it's maybe prompting a little bit more YOLO behavior than was previously sort of acceptable. And I mean, I guess, what do you think are the...

scariest things that organizations are liable to do with LLM usage internally. And I mean, I guess also more broadly sort of where do LLM products get scary from a security standpoint. But given that a lot of the listeners are gonna be integrating specifically coding agents and also sort of like internal productivity agents, where does that sort of...

What does that line up for you?

Karla (19:23.818)
Yeah, I think it kind of cuts both ways. So I've seen companies that are very AI shy because they're worried about the security implications. So like, no, we don't use any AI products. And I think that will be to their detriment in the long run. Right? Like I think you're losing out on so many benefits. Yes, there are obviously trade-offs and you need to mitigate risks. But I think that's a silly way to approach that personally. I would say the biggest risks right now are how many systems we connect with AI agents that we haven't previously thought about. Right?

So before I might be like, like I have a Slack integration over here and I have an integration to like, I don't know, come in any secret manager over there, right? But like never the two shall talk to one another because why would you connect Slack to GKE secret manager? And the answer is now like, well, they're both MCP servers that an engineer might reasonably need access to, right? So how do you stop the secrets from ending up in Slack by accident, right? How do you actually like put appropriate guardrails in place? And I think like,

Claude code and codecs attempt to solve that by like prompting users a lot, but they prompt them so much that people just say yes all the time, right? Or they use, for example, conductor, which has dash dash dangerously allow all and just turns off all the permission checks. So it could kind of just do whatever, right? So think like the overall security model for MCP servers is probably what scares me the most just because you put this thing in the middle and like even like assume that the agent is doing the, like it's trying to act in good faith, right? Which.

may or may not be the case, but let's just say that it is, even just given that it's acting in good faith and misconstrues things that you've said. The fact that it connects like all of these very sensitive things with all of these places that are very publicly accessible and also in a fairly opaque way, I think is some like a risk that people sort of overlook slash like are willing to just turn a blind eye to right now because they're so powerful. But that's that's what concerns me the most from an organizational standpoint, I'd say.

DNR (21:16.852)
Mm-hmm. Are there any patterns that you've seen that are useful in mitigating that risk?

Karla (21:24.867)
I mean, I think always the best pattern is to assume that the LLM is like trying to be nefarious, even if it is not, right? Like, you know, the, just because Occam's razor says that it is probably not trying to be nefarious does not mean that it like doesn't in fact accidentally do like things it shouldn't. I've had LLMs like merge stuff to main. I mean, I've had, like I've had,

DNR (21:41.454)
Heard it here first, folks. We've reached takeoff. The AI is taking over.

Karla (21:48.632)
LLMs merged off to main without explicit consent before, even though they're told not to, right? Because they're like, oh, well, I thought this thing you said earlier meant that you wanted me to merge to main. But it's not what I meant. And now the code's in prod. And it's fine in this case, but it's a little concerning that you weren't bothered by this, right? So obviously, the best thing to do from a pure security perspective is limit the functionality that it has access to. for example, with secrets, maybe say, no, you can't get access to the secrets.

you want to give it access to the production database so that it can do whatever, like diagnostics on all of your customers and things like that. Also fine, but maybe encrypt any secrets that you have to store in the database so that, like, know, additionally encrypt them so that AI wouldn't have access to that, right? Essentially like the classic security thing of like, if you don't have access to it, you can't steal it.

I think that's probably the best you've got there. You can add hints to MCP servers indicating that they're destructive or read-only actions, but they are only hints. And so they're only as good as, know, LLM checks. I think Anthropic and OpenAI are working pretty hard on how to make permission checks better, but it's a unsolved problem, I would say, within the entire human factors element of computing of how to prompt appropriately for permissions.

The ideal thing obviously is to prompt when something needs it, which is what Cloud Code does do, right? Like it's similar to the, like, you know, mobile phone permissions interface, but there's so many things that it has access to and knowing what is or isn't sensitive can be quite a challenge, especially if the person is asking the questions, who isn't themselves technical and doesn't themselves understand the security model of their own machine. So like my ideal thing would be if we could all run, do our development on a, you know,

entirely isolated machine where you could just give it dangerously do whatever it wants, right? And only mount it to that container, whatever you need. But I've yet to see anyone doing that in an effective way.

DNR (23:40.622)
Hmm. I think like even, you know, there's certainly folks who have.

who are dev box style stuff where you have a machine in the cloud and the agent is running on that machine. But I think your point might be that like it's difficult in most cases to do productive development work if you don't have access to a lot of these tools. I also think there's a certain irony where, you know, I'm kind of in a very early stage startup environment these days. And the sort of default move in the very early stage startup is like, you know,

Karla (23:59.032)
you

DNR (24:19.988)
very high trust environment, give everyone access to everything. And that works great when you have lot of really sort of conscientious humans working together. But I'm finding that I'm actually reaching for tools that have sort of enterprise-ish granularity on permissions so that we can constrain the agent's access. Like, yes, give the humans access to everything, but then I want very fine-grained permissions.

on the coding agents and it's it's sort of like a funny realization because it, you know, prematurely increases our bills with lot of vendors.

Karla (24:57.688)
Yeah, I mean, think like, we talk about how the new frontier models and their ability to write code for us and stuff like that, I don't know, makes you like a 100 times engineer or 10 times engineer, I don't know, like some extra order of magnitude maybe. But it also makes your organization have all of the problems of an organization that's that much larger as well, right? So all of the security problems, all of the like, audit trail problems, like you move that much faster, you get that many more things that you have to deal with.

We've actually had fairly good results, I would say, with adding security paved roads to our agents' advice. So for me, especially not working full time, I'm the only true security person at my company. It's still small enough that there's just me. Being able to put in paved roads so that it's like when someone tries to do something that they don't realize is unsafe, there's some guidance where the agent is like, hey, you're trying to ship data to a new third party that you shouldn't be like, did you mean to do that? If so, it's fine, right? But just have it.

call it out and I've actually had it do it for me. was like, hey, you're like shipping extra analytics data to log rocket here and you're not supposed to do that. I was like, huh, good call. This is a demo app, so it makes no difference. But it was good of you to point that out. And that has been helpful at the very least.

Alex (26:05.148)
Could you, yeah, could you say a little bit more there? When you say paved road, what do you mean? And like, what does that look like to tell an LLM about a paved road?

DNR (26:05.418)
is so go ahead

Karla (26:14.341)
Yeah, so an example might be, let's say that someone who isn't an engineer by background, right? Like maybe they're like a Ford deployed engineer or maybe they're like on the sales team. Now they've got a code code with them. They want to build some kind of demo thing, right? So the classic for us would be when we do sales prospecting these days, I think everyone gets a custom demo app basically, because like, why not, right? It costs nothing. And so obviously that now means that there's a lot of quite non-technical folks who are technically writing code, right? Like they are going off and shipping these things.

And the natural next step for those people is like, I want a dashboard, for example, that shows like how my sales stuff is going. I want a dashboard that shows this one custom thing for this one particular customer. And that's a very reasonable thing to want. And then the question is like, where do I deploy it? How do I do access control for it? How do I make it so that, you know, this works for this customer? And obviously the easy thing is like, put it on the public internet. It'll work great. People usually aren't so naive as to do that, but they might say like, I'll use this like.

platform as a service style company that just goes off and like, lets me host code really quickly, right? And that's fine if it doesn't have any sensitive customer data, but if it does, now you've suddenly got like this new vendor that's hosting customer data that you shouldn't have been using and you had better ways of doing it, right? So the idea here is rather than leaving everyone to the wolves to figure out the best solution, you document in your agents.md file, like, hey, like if you want to host data of this shape,

And like, this is the problem you're describing here is the way that we would recommend doing it. Basically here's a template project that's been set up. Here's like, we've tried to optimize it for like, in our case, it's like, okay, maybe it's okay to require an engineer to be involved the first time it deploys, but not on every subsequent deploy, right? How do you make it so that you sort of balance that trade off of like, you just want to check that someone has slightly checked the configuration of this with also like letting people move fast. And the same thing goes for like, you know, we have row level security in our database, right? So one.

particular customer can't access other customers' data, right? You can bypass that if you try. It's got obviously like ways of turning it off for particular tables, which might need to have cross-customer data for like, I don't know, maybe like the customer table itself, obviously, is like, we can't check that you're authenticated as a customer until we've checked who you are. That has that security turned off, and then we expect extra rigor on those queries. Telling the agents like, hey, don't turn that off just because it solves your problems the rest of the time, right? Because sort of my general model for LMS is like, they will try to help you solve your problem.

Karla (28:34.434)
And they weren't necessarily thinking about the externalities of trying to help you solve your problem as quickly as possible, right? And so it's like, yes, it's true. If you turn off authentication on this route, you will find that you can develop it much more quickly, But ideally, everything should be authenticated by default. It's really very similar. It's like my model for it is usually like I have a

DNR (28:36.983)
You

DNR (28:47.062)
It's not all that different from human engineers. The security stuff is quite pesky.

Karla (28:54.678)
Yeah, I have a very like junior, like a very enthusiastic junior or maybe mid level engineer, and they are absolutely convinced that they want to ship this thing today. And they cannot question any of the assumptions that they have been given because they were given by a senior engineer and like, you know, heaven forbid that they choose to question any of those things, right? What would I put in place such that I wasn't scared about what that person could do is what we try to encode in like agents.md files, right? So it's like whatever you might have as like best practices, I guess, equivalent documents.

Well, like, OK, let's stick that in agents.md file, have an LLM edit it for like, you've got an LLM audience, right? So break it up appropriately, like, try not to shove too much into the context to start with, just what you need to know for them where you should look for, like, security guidance on, for example, prompt engineering lives in the directory that has all the prompts in it, right? So that it only needs to load that in when it's actually doing something relevant to that area.

Alex (29:44.177)
That's cool. So when people are trying to create these like demo apps, how do you make sure that they're like getting the shared agents or cloud.md files, especially if they're deploying someplace other than your like where production would go. How do you make sure that people are getting all of the LLM knowledge?

Karla (30:05.618)
Yeah, so for us, people are usually using Cloud Code in one of two repos, either a personal productivity repo, which has all of the skills that are not specific to our engineering practices, and then also our main engineering model repo. So for us, we can luckily just put this guidance in one of those two places.

and then people will get it basically by default. It also just so happens that like when people are shipping customer data to places, they would need to have access to like the databases and that's granted in the engineering monorepo config. And so like we've not had a case where anyone's been off like shipping customer data by hand somewhere else, because that would be slow and time consuming. And they're not trying to bypass these processes. They just don't know that they exist, right? So if you sort of put it in the same place that you get access to the data, then it just comes bundled for free.

Alex (30:52.294)
That's interesting. do you, the personal space is that does everyone have their own or are you sharing this sort of like this fuzzy space that's not like engineering production, but it's like this like sandbox or test bed for sort of LLM stuff.

Karla (31:06.495)
So this is like a personal productivity reverse. It's got like skills that people might find useful across the company, but that are not specific to any given one person and are not engineering related. So an example might be like, oh, like post an update on how my project is going and it will like ask you the relevant questions for like whatever format we're using that week in terms of like how the project is going, ship updates to Slack, ship them to wherever else we want them to go.

similar calendar management style tools, they all go in there. There are in both repositories like a .playground or something directory that's ignored. So you can stick extra skills and things like that into a place where they're just for you in particular. But we're very encouraged to push the changes out to everyone. So we have a skill, for example, which is like ship things, specifically creates a PR, checks for automated PR feedback, checks for the CI monitor, fixes all of those things, addresses any PR stuff, specifically asks to merge, merges, then does post-deploy monitoring for you.

all of that sort of thing. And that's obviously just in the engineering repo.

DNR (32:02.19)
unless you're using conductor, in which case it marks it as done and moves on.

Karla (32:06.7)
Well, it hopefully merges it for you and then does the post-deploy monitoring and you're like, I guess it's good that you monitored the code that you accidentally merged. But yes.

Alex (32:17.69)
I was curious, you've mentioned a couple of fairly long range tasks. Are you using anything special or are you just using a normal ticket management tool to sort of encourage agents to work more long range or work on a broad set of work?

Karla (32:35.147)
I don't think it's anything to do with ticket management stuff. think a lot of it is sort of like how you, I guess that's not true. We use superpowers, right? So the Obero superpowers plugin, we use that pretty heavily internally. I wouldn't say everyone's using it, but I think almost all engineers would be. So that obviously encourages a particular style of development, which makes it a lot easier for you to like, essentially what it will do if you like,

give it a very vague task, is it will ask you questions, create a design doc, then take like, you review the design doc and be like, cool, I'll write an implementation plan, takes the design, breaks it up into a series of stages, and then is like, how would you like me to implement this? And you're like, subagent, and then it just goes off and does its own thing for each of the different steps. Usually I add in.

Alex (33:13.03)
Have you ever not been a sub-agent? Have you ever not selected one on that question?

Karla (33:17.654)
Yes, I've selected the other one a couple of times. It's been incredibly painful. Don't do it. No, the other thing I found is like you use the whole superpowers flow and it's like really good. Generally very excellent. But after it's finished doing a very long range task, I usually then open another chat in the same work tree. And I'm like, look at the design doc. Look at the implementation that exists here. Do they match? Are there any to-dos? Cause I've definitely had a couple of times over like long tasks where it's like, and then like to do implement this hard thing. And I'm like, no.

I want you to do the work. That's the point of using AI agent is that you do it for me. And so definitely like almost like if you've heard of like Ralph, which is like the idea of like just giving the same prompt repeatedly. I feel like I do that a little bit manually after superpowers runs and just be like, are you sure that everything is covered here? What's different between the two? Okay, those things are minor and I don't care about like rate limiting in particular on that endpoint, but like doing that I think has like been surprisingly effective as a fairly simple strategy to actually get it to properly finish tasks.

I think like that works quite well for, I want you to implement this big feature that I understand, because it will go through and spec out feature stuff. Doesn't work as well for like security audit style tasks. So in those cases, I've usually found it better to do like, go off, I do a full security audit, give me all of the things that you think could be issues. Okay, write them in an MD file. Now in a new chat, go through and for each of those in sub agents or whatever, don't care, generate a proof of concept and check.

that that actually is a valid vulnerability. Okay, it is now go off and create a linear task for each one that is a valid vulnerability in this project, right? Okay, now, you like a new entirely new work tree or new context at least, like, okay, for every single one of the things they go off and create a sub agent that fixes the problem. I think like usually it's mostly about like context management. So like you can ask it to do a very like broad task. And the thing that you tend to find is just that at some point in time,

loses context. So for the security audits, for example, I had to repeatedly be like, are you sure that's everything? Think really hard. Are you sure that's everything in that category? And even then it was more effective when I, rather than saying like find vulnerabilities, was like, okay, find vulnerabilities of this shape. Just because, you know, it's kind of like a human and it's like there's only so much it can remember at any given point in time. And so asking it to find things that look like a specific shape tends to be more effective and works quite well with a sort of like iterative process of like writing all of the

Karla (35:40.054)
findings that you have into like a notion or linear, like notion doc or like linear project, and then going back and subsequently going and fixing each of them. And I guess to your point of like, how do you keep track of all the projects? It's a little bit easier for me personally, if I'm like, okay, the thing I'm doing right now is like lots of deep auditing. Okay, now I found all these terrifying things. Now we'll go and fix all of the terrifying things as like different strategies to sort of keep yourself in the one head space, I guess.

DNR (36:07.436)
You mentioned earlier in passing something about a prompt for the tone to use when writing an internal document. I think you said something about sort of be more fact oriented instead of persuasive or something like that. And so the implication there is that many internal documents are drafted in partnership with agents. How does that process work?

Karla (36:23.706)
Yep.

Karla (36:37.048)
In terms of like drafting documents internally and then sharing them when they're written by AI or?

DNR (36:43.81)
Yeah, maybe to add a little bit more color, think something that I've experienced and that I think others experiences out like AI agents are great at writing lots. And that can lead to a dynamic where you have one person using an agent to generate a bunch of pros and then another person using an agent to summarize a bunch of pros and

the agents are basically playing telephone between the people. And I think that there are also effective ways to use agents to write documents, but I'm just curious if any of what I just described resonates and sort of what you all have learned around that.

Karla (37:31.037)
Yeah, I would say that we aspire to and usually

hit the guidance that you shouldn't be asking another human being to read something that you haven't at the very least edited, right? So the sort of like that equivalency of work, right? Like you shouldn't ask someone to do more work than you put into a document, right? Like reading it shouldn't be harder than writing it. And so I think what that means is like, we try to keep the number of documents that we share amongst ourselves similar to what it would have been sort of pre-AI, but maybe you just save some time on the writing and get to spend a bit more of your job doing something else.

But you still obviously need to edit it. I guess an example of where AI-driven stuff has been super useful for me has been like, I, after doing the security audits, had to write up a threat model for me. I don't like writing threat models. I like the concept of threat models, and I like using them, but writing them up is super tedious and boring because it's just a catalog of things that could go wrong. So I drafted with an LLM a threat model that I don't really intend anyone else to read. It's more for me to think about the problem.

But then I was like, okay, given that we then implement these fixes for this threat model, right? If we had all of this be true, write me the sales pitch for marketing, write me the sales pitch for like a customer, keep it short, right? Like I don't want it to be long. It's something we would show a customer. And then I went to our marketing team and I was like, hey, would you be happy with us saying this? Right? Cause obviously like the marketing team wants to be like, we are 100 % secure. agent will never ever say anything it shouldn't. And I was like, okay, you can never make that guarantee.

Right? Like I could tell you that we will never like share data between customers, but can I tell you that it will never like randomly spit things out that it shouldn't? No, of course not. Right? Like I can do my best and I can like put in these like product protections, but I can't make that guarantee a hundred percent. And that's obviously like a more subtle message that I wanted to make sure other less technical folks at the company was on board with before I put a lot of effort into like building defenses that they were not going to be happy with. And so for me, it was very helpful in that case, I guess kind of.

Karla (39:23.736)
to the thing I just said, like they specifically, I told it to write in a persuasive way because it's a sales pitch, Like write a sales pitch and then like show the marketing team, like does that sound like the sort of thing we're happy to say? Okay, great. Now that we've got that, I'll go off and like actually bother working on that because I know that we're all happy with the place that we're going to. Whereas I think the counter argument would be like, if you have like an RCA for an incident, right? Like a postmortem for an incident, you don't.

want that to be written persuasively, right? Like, yeah, it's totally fine to have the AI draft a bunch of it. We often do, right? Like timelines are not something that I need to manually curate to get the value out of, right? Like, fact, an AI is going to be way better at copying the exact timestamp that something went wrong in Slack or it went off. And even writing like a brief root cause thing is useful. But sort of going through and like editing it and making sure it has the right context for like the business situation is something that it...

needs some human guidance on and human oversight of and so we would make sure that like those parts were written by a human before putting them in our like great archive of things that have gone wrong for later analysis probably by an AI.

Alex (40:24.42)
Are you all doing code reviews of skills?

Karla (40:28.056)
I wouldn't say in a particularly formalized way. I don't think we have a great solution for how to do like skill testing and skill improvement, other than just using them and seeing what goes wrong. So that's by and large what we do. We have automated code review from Codex, I think on every PR. So technically there would be some amount of review, but I wouldn't say we go into any particular depth on it, no.

Alex (40:52.818)
I'm mostly curious because I think we're all starting to now use shared repositories of skills. You mentioned superpowers, which is one that I've seen really take off for a lot of different engineers. But then internally to teams even, there's some hierarchy. I'm really curious to see how this is going to develop. I have a strong sense for how Ruby should be written or Python should be written, but how a skill should be written, it's like everyone is equal at that table. You know what I mean? And it's going to be really interesting.

I think.

Karla (41:24.298)
Yeah, one thing that we've seen is that it's more effective to describe what you want to an LLM and have it write the skill for you than it is for you to write the skill. Because it's such a new area, it turns out that actually like the LLMs themselves tend to be better at doing it than humans because we have no practice and they have at least some training data on that. And so like that's what I've mostly been doing. I'm like, don't write skills myself by hand because I get them wrong. I have the LLM write them for me and then I go through and edit them if I see fit. But even then I would usually do that in partnership with an LLM because it

It'll think of ways that the LM gets things wrong that I might not. Then, you know, if I think of things I can easily tell it that and then it adjusts accordingly.

Alex (42:02.288)
Are there any other skills like superpowers that you see are being used broadly in general?

Karla (42:11.352)
I think Superpowers is the only one that's publicly available that I see being used broadly. Obviously, as I said, we have custom ones for our repos that are used quite commonly, but they're very specific to our business context. I don't think I know of other ones that I see people using a ton specifically.

Alex (42:28.635)
Neither have I for what it's worth.

Karla (42:30.154)
You

Alex (42:31.77)
Maybe, maybe Anthropic Skill Creator skill, like to you to write skills, you know what I mean? But not the superpowers one is really interesting to me because it's coming from outside of the the frontier labs, you know what I mean? It's sort of feels like it's like the first like jQuery of like skills is like the superpowers, right? Where you're just like, you need to use this thing. Like, I'll just use jQuery, just put it on the page.

Karla (42:45.229)
Yep.

Karla (42:54.55)
Yep.

Karla (42:59.37)
I think it's an interesting example of taking a methodology of problem solving and writing it down, because that's essentially what it's doing. It's just saying, when I solve a problem, this is the way I do it. And so think you can come up with other examples of where the issue isn't necessarily the knowledge. It's the patterns that you use for development or the patterns that you use to achieve a task. And so think you'll probably see, well, I would like to see the same thing emerge for different areas as well. You can easily imagine, here's how I do UX research codified as a skill.

Here's how I do other particular things.

DNR (43:28.032)
It is interesting that there's, it's basically, yeah, it's it's codified tribal knowledge, right? Things that would have previously been sort of like passed along probably verbally inside of teams and, know, from, sort of like, generation to generation of engineering. mean, make it sound like there were many, many generations before us, but you know what I mean? now it's like, it would have always maybe been a best practice to write some of those things down, but now there's sort of like,

an incentive and a mechanism by which not only will people write them down, but like there's sort of value in aligning on a few that everyone kind of agrees are good. So it's interesting to see that play out. One of the skills that I have found interesting is Vercell has a skill repo. It's skills.sh or something like that, a website, but it comes with a find skills skill.

Carla is terrified. It's a security nightmare, but, it's, it's interesting from the perspective of like, it does allow you to find things like this. Like there is a UXR skill in there, right? There is a whole bunch of web design skills in there and stuff like that. and so from sort of just like the perspective of being able to quickly pull these things off the shelf shelf and play with them a little bit, I've used sort of like.

copywriting skills from there and it allows me to be like a passable copywriter for, you know, our marketing pages or whatever. So those are kind of interesting developments.

Karla (45:01.206)
Yeah, I think superpowers has like a visual design skill that I use pretty intensively as well for like small demo things. Or it's like, it will launch a browser for you and be like, here is a mockup of like two or three different things. And for someone like me who like, I would not describe front end as my strong suit and especially not like good design. I'm like, yes, let me pick between three options to tell you which is wrong with that one option that I chose. And what I want you to fix is like, that is the level of design that I'm capable of. cannot like De Novo come up with a good design for you, but I can vaguely tell you that that looks better than that. Right. Or is more what I'm going for.

And so I find that very useful, but I think it's still technically part of the superpowers repo, which maybe is just an indication of how much superpowers itself is also growing, right? Like it's way more than just the thing I described, I it's sort of like the core loop.

Alex (45:40.112)
Yeah. We're about at time here. So we're going to ask you our last question, which we ask everyone, which is how much code are you writing nowadays?

Karla (45:50.41)
Like manually written code.

Alex (45:52.748)
I think it's up to you how you want to answer the question.

DNR (45:55.918)
So there is some history here. used to always, the previous season of this show, which was four years ago, we would ask people this in the context of like, oh, you're a staff engineer. Do you actually sit at your keyboard and get to write code yourself or are you just talking about writing code? And I think nowadays, whenever we ask that question, people look at us and kind of like, do you mean like literally writing code manually the old fashioned way? And so I think you can take it kind of however you want, but like,

Karla (46:00.12)
You

Karla (46:12.408)
You

DNR (46:24.718)
I think the intent behind the question is like, to what degree are you thinking about the code layer versus all the other shit that goes into making software?

Karla (46:40.416)
Yeah. So I joined a small startup so I could write more code. So I was writing code even before I was using all the AI tools again. But I certainly write a lot more code these days with AI's help. I kind of think of it as managing a team almost of people who are going off and doing implementation. That's the closest analogy I found to previous work. In terms of writing manual code, never without at best tweaking a prompt that I found somewhere, but essentially never.

We do more reading of code these days, right? Obviously for code review, but even just like when there's, I want to find the log line that's relevant. Maybe I know exactly what to search for. And I'm like constantly confounded by why like conductor does not allow me to globally find within my code base. I don't need to change anything in the file. Just let me find things in the file, in the like repo. but yeah, I would like read code a lot more than I would ever write code manually these days. We had an interview the other day where someone's conductor or something hadn't been working in the interview that we were giving them. And we were like,

you wrote code like real bespoke code. And it's like, this is ridiculous. Six months ago, we would never have used the term bespoke for writing code by hand, it's so, yeah, exactly. It was like, artisanal code, right? But that's what it feels like these days.

DNR (47:44.545)
person showing off writing writing assembly line by line in their interview

Alex (47:59.356)
Well, thank you so much Carla for joining us. It was great meeting you and getting to learn from your experience.

Karla (48:06.264)
Yeah, it was great chatting. Thanks a bunch.

DNR (48:06.382)
Yeah, this is tons of fun. Thank you.
