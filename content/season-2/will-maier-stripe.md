---
title: "I Haven't Opened an IDE Since November — Will Maier (Stripe)"
date: 2026-03-16T00:00:00Z
draft: false
key_quote: "I personally have not opened an IDE since the end of November. And the engineers that I work with also have not. The magnitude and the speed of that change is so much greater than anything I've experienced."
---

<div style="position: relative; padding-bottom: 56.25%; height: 0; overflow: hidden; margin-bottom: 2rem;">
  <iframe src="https://www.youtube.com/embed/52cZCc7Sy3c" style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; border: 0;" allowfullscreen></iframe>
</div>

<div id="buzzsprout-player-18827390"></div><script src="https://www.buzzsprout.com/1687069/episodes/18827390-i-haven-t-opened-an-ide-since-november-will-maier.js?container_id=buzzsprout-player-18827390&player=small" type="text/javascript" charset="utf-8"></script>

Will Maier leads growth engineering at Stripe, where he's spent the last five years working across nearly every surface of the product. His background isn't CS — it's the history of science — and he's been through enough industry shifts (racking servers, the cloud transition, DevOps) to know when something really big is happening.

Find us now also on YouTube: [@StaffEngPodcoast](https://www.youtube.com/@StaffEngPodcast)

In this season premiere of StaffEng, Will joins Alex and David to talk about what changed for him after November 2025, why he spent the holidays building a Lua distribution from his phone while doing laundry, and how he thinks about the organizational dynamics of AI adoption inside a large engineering org.

Topics covered:

* Why Will hasn't opened an IDE since November — and what replaced it
* The psychology of AI adoption: shame, hallucinated PRs, and "AI vegans"
* Skills as the new packages: how improvised markdown files are changing how teams share leverage
* Why measuring token usage (the wrong metric) surfaced the right insights
* The case for making the incident report critic, not the incident report writer
* What the cloud and DevOps transitions teach us about where AI is headed

## Links

- [Cosmopolitan libc (jart/cosmopolitan)](https://github.com/jart/cosmopolitan)
- [whilp/cosmic — Will's Lua distribution](https://github.com/whilp/cosmic)

## Transcript

*Note: This transcript was generated using automated transcription and may contain errors.*

Alex (00:01.692)
Hello and welcome back to the Staff Ang podcast. New season, new format. We're gonna go a little bit more raw this season. Just jump right in. I'm Alex. Last you heard from me, I worked at Stitch Fix. Now I work at Stripe. I'm gonna let David introduce himself and then we will get into it with our guests.

DNR (00:24.2)
I'm DNR. Last you heard from me, I worked at Stripe. Now I no longer work at Stripe. It's the musical chairs are out here apparently. Yeah, I've been doing an AI startup for the past year or so. Very excited today to have Will on the show with us and to kind of dig into the new world that we all find ourselves in.

Alex (00:45.01)
Yeah, so Will, I'd love it if you just sort of give us a quick rundown, introduce yourself.

Will (00:50.732)
So I'm Will Meyer. I work at Stripe. I haven't changed jobs at all and it is an honor to be the raw, the raw guest and get this started weird, which feels fitting for, for the topic. I've been at Stripe for almost five years and lead growth engineering, which is not obviously or specifically topic, topic to, to dig on here, but does mean that I do a lot of work just broadly across Stripe. Basically, every surface we can, we want to make it work well for users around the world who are just finding Stripe and getting started. So they need the product to work great, and we need to have a lot of high leverage. And so I kind of back into a lot of quality and technology and then lately, AI issues from there.

Alex (01:38.596)
Awesome. I think maybe a great way to sort of start, and this is a question that we asked ourselves when we started this is like, when was your sort of like aha moment of like, my goodness, this is gonna change everything. You know what I mean?

Will (01:50.926)
I mean, the change everything was November 28th or whatever, right? The Opus four or five splash. I feel like I've been through waves of that feeling in the last couple of years. I remember doing workshops, we have an internal tool, you know, just a basic chat thing. And even that, you know, like for standardizing incident report shapes and executive summaries, you know, that was like, whoa, you know, this is already doing stuff that I'm old enough to remember that being, you know, not a thing that's going to happen. And we're always just a little bit ahead. But last November was really different qualitatively in terms of what felt feasible and then how fast things have moved since then, especially like the jump in model quality followed by, you know, harnesses getting better, us humans figuring out how to work with these workflows better.

Alex (02:56.998)
Yeah, do you remember the project or the project that you were working on or what you saw? What was the quality of the thing that was like, my god.

Will (03:04.238)
Yeah, like a lot of people I sort of like had a bookmark in my brain from end of November and then you know for us at Stripe December is usually pretty busy until it stops being busy completely. And like many other folks I was in the 2x usage thing on Claude and so I spent the holiday doing something that I've wanted to do for a really long time which is make a good Lua distribution that has a really rock solid standard lib for system programming. Have you used Cosmopolitan, Lib C, Justine Tunnies?

Alex (03:43.482)
I've heard of it, haven't had a chance to use it yet. You might want to just give a quick rundown for what Cosmopolitan is.

Will (03:49.974)
So like turn off the podcast and go check this out because it's that good. It's a pretty brilliant set of hacks, frankly, to make portable executables that run anywhere, everywhere, and that include a really big, reasonably built C-libc. And Lua is not a great language, but it's especially not a great standard lib. And with agent stuff, I knew I wanted something that I could program, that agents could program, that would be, you know, distributable, reliable, and complete. And so I dived in, like, just within a couple days, had the libc patched up the way I needed it. I had the Lua distribution building. I don't, frankly, speak C, so that's a thing. And that's a multi-million line of code repo, it's a big chunky thing. And then from there, you know, in early January, I was building an agent harness, like, just the pace and layers got really weird. And I ended up writing a trip report just for myself, just like stepping back and looking at what had happened at the end of 2025. And I had felt that sense coming out on November, like I couldn't escape it by the end of December.

Alex (05:15.91)
Yeah, so I think that's amazing. I think there's a couple of things that I want to like sort of call out there and make sure I'm getting this correct. Lua as a language is kind of amazing because it ends up being an embedded language in a large number of different things. And so it's used quite broadly because of its ability to sort of like kind of fit into a place. And sort of where you identified an adoption issue where, because of its tooling, it wasn't easy to use or great to use for end user quality. And so you were like, if I can make this one tweak, I'm making this language that is used very broadly in a lot of different places easier for all the people who have to write it.

Will (05:54.586)
A little bit, almost the opposite in a weird way. Justine uses Lua as the sort of scripting language in Red Bean, which is like yet another awesome weird thing built on top of Cosmo. Red Bean is like a web server C program. And she built in this reprogrammable Lua bit, which is like a really reasonable common use of Lua. As a side effect of solving that problem, she just fit Lua well into the cosmopolitan ecosystem. And so I kind of inverted that. And instead of using Lua to script a C program, I just jammed the rest of the standard lib into Lua and exposed it through the Lua C bridge. And so you get Lua for better and for worse with the whole breadth of a good libc that can run on any system without the programmer needing any awareness of the system they're running on.

DNR (07:18.196)
So before we go on, because I'm a little nerd sniped here, what are some examples of use cases?

Will (07:25.506)
Because of how solid and comprehensive Cosmopolitan is, it has SQLite in it, it has everything you need to do everything Curl does in it, it's sort of like nuclear batteries included in Cosmopolitan. And so without really thinking much, you just expose that up through Lua, and then you get a single thing that can do all of the stuff you'd want to do for systems programming. And for working in a Claude Code web interface, I just drop that in. It teaches Claude how to use it basically through the help flags. And then I can solve any coding problem that I want there.

DNR (08:11.38)
Sorry, you're using cosmopolitan via Claude Code for web — like Claude is running your CLI in the Claude Code microVM?

Will (08:26.862)
Yeah, the Claude Code web is just a gVisor sandbox situation that they spawn up and my motivating problem in December was like I wanted to write actual code there and run my tests and have a normal development experience. And doing normal things in that context is hard because you have to download Python and all of its steps or node and all of its steps, etc. But because Justine's a genius, this is just like one five-meg thing. It's the same asset that I just build in GitHub and run everywhere. And so I can drop it there and then it exposes help flags and docs and stuff to Claude, sort of like a dynamic skill. And then Claude Web or Claude on my box or my own weird agent harness — they all just learn how to use it because it's a normal libc under the covers.

DNR (09:20.52)
Very cool. Okay. I'm going to un-nerd-snipe myself because I think we want to ask some sort of higher level questions. Before we move on, where could listeners go? What's the one URL to rule them all for this stuff?

Will (09:34.316)
The one is Justine's because she's the one who did all the really cool stuff and that's jart/cosmopolitan on GitHub. And then the hacks here are whilp — W-H-I-L-P — slash cosmic, which is the Lua distribution.

Alex (09:59.922)
I think like some of the stuff that you're talking about — the quality — we are all engineers and we kind of tell ourselves a little bit like, yeah, if I just have enough time, I can get to that thing. I can learn C if I just have enough time. And so we have this huge list of things. And I think one of the things you're explaining is like the thing that knocks our socks off sometimes with this stuff is like, you can be like, I'm just gonna take that notion I have and I'm gonna throw it out there in the world and it's gonna come together really quickly.

Will (10:38.092)
Yeah, it's both — ambitious, maybe. I know C kind of, but not enough to do what I wanted to do here. And then it's totally work that I never would have taken on. So it's both lowering the bar in terms of what I need to do to sit down and make some valuable increment in the software, and raising the bar in terms of what I feel like I can go do. And as you mentioned at the beginning, I'm a manager. So I don't do this every day, most days. That's been really empowering for me. I was sitting in the laundry on my phone, having Claude Web do stuff to this system, hanging out with my kid. And the fact that this was during the holidays and that I could be in the holidays and also doing pretty massive hacks at the same time felt new in my career.

Alex (11:33.234)
Yeah, so that's a great transition point. So you are a manager, you had this aha moment. So you just walked in on Monday and you probably did nothing at work, right? I'm curious what you actually do.

Will (11:43.534)
I mean, I've been flipping out basically every day this year in the sense that it's getting probably a little annoying — but the sense I had that like, okay, actually, yes, this is different qualitatively. This is a change for better or for worse and about which I'm still pretty ambivalent. But a big, really quick change. That was a very stark feeling coming out of the holiday break. And then the way I thought about January is like, I just want to work outside of Stripe for a couple of reasons — to figure out how weird this can get, and especially to quickly figure that out. Because my belief was that the tools are not set — Claude Code was releasing at least daily in this period. Everything is changing fast. Second, it doesn't make sense to bake stuff yet into how a big company does its work. This is still a discovery phase. And third, I personally need to figure these things out so that I have better intuition.

So for January, I was just hacking a lot. And then trying incrementally to port sort of the basics back into the work we're doing at Stripe. So having Claude Code, yeah, but then are we moving into skills? Are we sharing those skills and making them available to each other? We now have an internal plugin marketplace. But incrementally, figuring out the furthest thing I could think of and then coming back to layer on the next thing and the next thing. Doing that just because everybody at Stripe is trying to figure these things out — not because growth engineering has a specific mandate on this. This is just about how the craft we do is changing.

Alex (13:43.986)
I'm curious — skills are an interesting sort of point of diffusion. It's almost like a library or a package you could distribute back in the olden times. What do you think has been some of the most impactful skill categories? What have you seen your team use most effectively?

Will (14:09.656)
We have a fun one. The best ones have been kind of improvised internally. One of the ones I really like — you can think of these tools as intermediating your work, or maybe reflecting or in this case criticizing — an engineer came up with an incident report critic. Take an incident report, tear it apart, and identify all the ways in which you could go deeper in understanding the contributing causes, in which you could make the timeline clearer, in which you could identify remediations and pull it out.

It's just a hundred lines or something. Super straightforward. But just pulling that out of the "I'm making the report" loop and into a "here's the opportunity to improve this report" — that was really cool. And especially cool because that engineer just did it and shared it. It wasn't a big fancy thing.

For us at Stripe, we had a lot of goals last year about incorporating agentic stuff into our work and we made progress, but that required coordinating — the team would need the primitives on the roadmap to support the agent thing. In contrast, January felt like it's not a big deal. Everybody is experimenting with basically markdown files that can do who knows what. The simplicity, and the improvised nature, and the pulling it out of "doing the work for you" and into "helping the human understand the incident" — the work of making the report is valuable. If we instead criticize and level up that work, we get the benefit without losing the insight you get when you make the report.

DNR (16:12.682)
You mentioned something interesting — just like everybody is now able to play with markdown files. My experience since November has been a more playful experimentation with a lot less overhead to try new things. One of the conversations we had during our listening tour — someone talked about AI vegans inside their organization. People who have some sort of aversion to adopting AI. How do you think about those objections? And philosophically — Block just laid off like half their engineers. It's possible to get down a rabbit hole of "my God, everything is changing." How does that fit into the organizational dynamics you're working inside of?

Will (17:48.782)
The reason I've been flipping out is because both — I'm interested and excited and I get to do this C thing I've always wanted to do and I feel like I have superpowers — and I'm terrified. This is so fast and so big. Absolutely there's a huge variety of people at Stripe. Zooming in on engineering — folks at various points in their careers, brand new interns whose entire experience of the craft starts from here on, and folks who've been at Stripe for years. Everybody is starting from a different point.

Some of the most inspiring stuff I see is our interns — they are in deep. When I look at the data, they are very curious and trying everything. I've seen cases where interns are using Claude's "teach it to me" mode to explain the codebase back or build little walkthroughs of the codebase. That feels purely good. Just a beautiful, unalloyed good.

And then absolutely there are folks who tried any of these tools on November 27th and it sucked and they're busy. They're trying to ship. They're maybe feeling deluged by sloppy PRs filling up the review queue, bugs that are landing that they need to clean up. For me, it feels a lot like what I remember the pre-cloud world to be. I remember the pre-cloud world — the first part of my career I spent putting machines into racks in data centers. AWS started to be a thing, and soon my personal job shifted from doing that to writing software to build cloud infrastructure. My job went away. It changed over a couple of years. That felt fast.

I personally have not opened an IDE since the end of November. And that's not atypical — I'm a manager, but the engineers I work with also have not. The magnitude and the speed of that change is so much greater. The disruption that comes with it is going to be real. There were people who built all of Netflix's data centers and ran their DVD shipping operations, and then it was in the cloud. Individual people can make that leap. That's why I feel so engaged with my teams in particular — dig in and just figure it out. The ambivalence I mentioned is very deep. Very big potential upswings and very big potential downswings. The only thing I feel at the end of that is urgency to get in there and figure it out.

Alex (21:43.378)
I also started my career at an ISP doing hardware stuff. The tectonic shift — I actually remember at an ISP seeing Amazon for the very first time, allowing you to buy a computer, and asking the people who ran the ISP if this seemed like a problem. They told me all the reasons why it wasn't. I wasn't convinced. Is the cloud transition a useful mental model for AI adoption, even though AI is moving way faster?

Will (23:16.354)
I think it's way faster. Nobody says "growth hacking" anymore. My focus is not just engineering — growth is very cross-functional. Zooming out, this is about people who work in knowledge and make things with their brains. This is the DevOps for work moment. How we do all of the things is changing kind of at the same time, flowing out and becoming more evenly distributed across everything.

My experience of DevOps was empowering and liberating, but it wasn't obviously a good thing. It wasn't foreordained that this would be net best. There were a lot of risks implicit in it. Same with cloud — we're going to put everything in Virginia, this is going to be okay. And it wasn't always okay, and still isn't. The sense that there will be disasters as we adopt these tools, there will be really big problems until we figure out how to operate in the system safely and efficiently — that feels very true. Then again, do we make the incident report writer and forget how to write reports and forget how to learn about the incident? Or do we make the critic that guides us to better and deeper understanding? There are at least two paths. I'd be excited if we can start to develop more of a DevOps-style culture — automation, but also measurement, shared ownership, plural pillars — that we haven't built yet into the tooling changes happening now.

Alex (25:48.686)
You give a lot of cheerleader energy and I love it, but you also make sure we have critical conversations. I'd love it if you could chat about the thread you started where it was like, I think people might be feeling awkward about their use of AI — can we talk about that? And more generally, how do you find and bring these conversations to a bigger audience?

Will (26:43.02)
I feel really lucky that my day job is actually getting things done with people who need to get things done, rather than just thinking about this. In the past, there were DevOps engineers and then there were teams that did DevOps — the latter were more successful insofar as they were informing what they were doing with a way of doing it rather than focusing on the tooling itself.

My engagement is fueled by what I'm hearing from the engineers I work with. The intern on my team, the engineer who made the critic — these are people trying to build careers and trying to figure out what all this is. I have my own experience of hacking in the laundry, and I'm also hearing from engineers and interns about what's working and very much not working. The sense I had — this was a couple of weeks ago, which feels very far — was that there was a little bit of shame. As folks were getting further faster, they were making mistakes. One of my engineers made a whole PR based on essentially a hallucinated fact about a system we don't own. That's not uncommon — we did that as people two years ago because things are really complicated in the guts. But it played a role in the scenario, and they felt like, crap, I should have found this, I might look like a bad engineer.

So it felt important to try to find somewhere to have a conversation about how it actually feels as an engineer to be exploring this now. I was really blown away by the thread — TLs, important people, and just tons of engineers shared that feeling. They tried something, got their wrists slapped for it because we're still not sure about the right security guardrails. Or they shipped something accidentally sloppy, then went in and cleaned it up. That sense of guilt or shame came through. Just in the few weeks since, I think that's subsided a little bit. We're normalizing stuff that felt edgy. I sent an email internally last year, subject was "it's good to feel bad." I really believe that — when I feel bad about stuff, it's me reminding myself I want it to be better. Some of those feelings are right and we should respond to them. But already we're past that edge of shame and into broader adoption, and a new set of bottlenecks around how do we actually review the stuff we're making, how do we verify, how do we integrate and deliver. More practical, less emotional — but still the thing we have to push through to get to the value.

DNR (30:51.338)
It's a really interesting observation — the psychology required to succeed with AI. You have to be okay making mistakes. But with AI in particular, you're effectively delegating to an entity you don't know that well yet. Anyone who's worked as a tech leader understands that delegation has always been a fine balance. And forcing yourself to do it when you're working blind is scary. It reminds me of first becoming a manager — finding the balance of "I would have done a better job of that particular thing if I did it myself." But you have to get out of that mindset. Counterintuitively, everyone is now a manager. Everyone needs to learn the rules of delegation. And the organizations who move fastest with AI are the ones who have always had enough give for individual contributors to make mistakes.

Will (33:45.464)
Yeah, one of the things I've been struggling with is I'm not seeing enough mistakes at all. The question I ask frequently in one-on-ones: tell me about something you did that was wrong. I'm not seeing enough. It makes me worry that either they're happening and folks are obscuring them, or more likely we're just not pushing hard enough — not close enough to the envelope to discover both the valuable stuff and make these mistakes while there's still time to change what we're doing. I'm really intensely interested in what is weird, what is janky, where are the mistakes happening, and how do we funnel those back into what we do as managers and in central tooling in order to pave a path around or past those mistakes.

Alex (35:02.13)
I had an opportunity to lead a conversation just about AI, and I took a more objective path — pulled up an internal report, went to the top users, and just asked what they're doing. It led to some of the most insightful conversations because we had one engineer describe how they're using the tool to create PR comments on their behalf. You could tell others were like, I didn't know we were doing that yet. That led to amazing conversation around legitimacy and quality management. But I don't think it gets there if we don't more actively throw these things into the world and say, I did this weird thing — what do you all think?

Will (36:03.278)
I made a dashboard and sent it around last week. Take everybody at Stripe — not just engineers, everybody — and look at their token usage on a trailing seven day basis, chunk it up into groups. First, that's the wrong thing to measure. Just using tokens is not what we're doing. But it's hard to use that many tokens at the upper chunks if you're just hitting tab in Cursor. Those are both bounded by how fast you can move your finger. There are people at these weird echelons past that point who have figured out the next thing. Sometimes they've figured out a multi-agent or continuous agent workflow that as a consequence consumes these tokens. The coolest thing I heard was "I just had no idea that was possible. I didn't know you could consume that many tokens." And folks, because they could see themselves in context with where other folks were, started to reach out and say, "you're number three on the whatever — what are you doing? How do I incorporate that?" Having that situational awareness is really hard. We should be careful about exclusively measuring the wrong thing. But sometimes measuring the wrong thing can give you insight about the right thing, and especially can distribute that insight so we can start to converge people on higher value, higher leverage ways of working.

Alex (38:02.142)
I had sort of a meta question. You mentioned you started racking servers and worked your way back through software. Are there existing priors or tools that helped you navigate that journey, and do you feel like it's the same set of tools helping you navigate AI?

Will (38:29.932)
Yeah, I have never taken a CS class. My background is the history of science, which both meant I was inevitably going to work at Stripe — there's an odd concentration of people who care about this there — and also that for the last 20 or almost 30 years, how people learn stuff and how that changes has been the constant theme of what I've studied and what I've worked on. So when the racking thing wasn't going to be the long-term, first I was like, this sucks. Second, interesting — this is a big change. What is the paradigm shifting here, who's participating in it, how does that change accelerate? So I joined a startup that couldn't buy racks even if we wanted to — enabled by or predicated on a cloud provider we could spin up with a credit card.

The waves of changes in how we make computer stuff have always meant somebody's got a specialized skill with a shelf life, and what's changing actually increases the amount of work we need to do. There's not less software today because of object-oriented programming. I feel really clear that there's going to be a lot more software this year than in any alternative. Even when I imagine everybody on my team doing pure high-leverage AI stuff, there's still a hundred-X more software needed in bespoke, highly contextual ways — just in all the nooks and crannies at Stripe, let alone all our users, let alone the whole world. We are so behind where people need computers to be. And if the labs stopped working today, we have years of work at Stripe just to catch up to the outputs.

I used to watch every Claude Code release, read all the changelogs. I'm exhausted. Not because the advancements don't matter — they're really important. It's just that from a little before November to where we are today, we haven't figured it out yet. And I don't think they have figured it out yet to tell us. Nobody is going to come down from the mountain with the best practices markdown file. We really need to figure this out in context. Just like we did when things changed in the past. I still feel the change here is bigger and faster than any I've experienced — and that makes me excited and also terrified.

DNR (42:11.05)
What do you think are the right forums for people who want to figure this out? Industry best practices emerged from the cloud and CI/CD transitions. There are conversations happening on X about AI best practices. Is there anything that jumps out? Any conversations you wish were happening, conferences that you wish existed?

Will (42:44.354)
This is very much back to the future for me. My account had been dead for years. I went back to Twitter at the beginning of COVID because that was where I could learn quickly what was happening. A lot of the speed and superlinearity of this change really reminds my muscle memory of that phase. And then the DevOps and cloud world — I'm coming back to Twitter/X right now, which I think is reminding me that yeah, this is that kind of change. Bunch of people together trying to figure out what's what. The last time I also went to a lot of conferences — DevOps stuff — and I do think we need as an industry that kind of integrating behavior where we sit down and talk about what this stuff is.

I wonder though — it would be hard to plan the conference for this year given November, which was truly basically weeks ago. The pace is intimidating in terms of how we as people are used to integrating that change. I think the reality is that most of the world is not yet contending with the really weird frontier parts. But it feels very urgent to figure out, at least in small groups, how we start to have those conversations — especially within companies, but across companies. I don't have the answer. I think online environments should be an advantage. We should be able across the world to connect and share things. I hope somebody figures it out.

Alex (44:37.36)
The general pattern you're bringing up is: lean into the signal. It might be high noise, but lean into the signal in moments of disorder or discovery because that's going to be the rawest place to quickly gather new facts and incorporate them into your daily life.

Will (44:55.726)
I personally do this as a manager — I don't shield my teams, I try to connect them. That's just my intuitive behavior. This is a moment of massive disruption and creativity and chaos and disorder, which sounds epic. And so I'm doubling down on that behavior and trying to connect other people to scale it out. I don't think everybody needs to go on Twitter and follow everybody in the AI space. But more people need to, and we need to get better at distributing and circulating what we're finding in compelling ways. There are folks inside Stripe who have concise newsletters that thousands of people read. It's a great opportunity for somebody to be the best at whatever it is. Those opportunities are scaling really rapidly. For individuals who are curious and have that bandwidth, there's a big opportunity. For everybody, it's just a question of practice — integrating it into the day, getting dissatisfied at the tab thing, and responding to that dissatisfaction with some spikes, some exploration, some bounded thing, and asking somebody else what they're doing.

Alex (46:30.992)
The old question from last season was "how much code are you writing recently?" The joke was that staff engineers weren't writing code, but the funny thing is they're probably all going to be writing code now.

Will (48:06.83)
The question is how much are you typing, right? My dotfiles — I celebrated the 20th anniversary of that repo last year. They've been really important to me. I don't think they really matter at this point because I'm in the shell all the time. But the configuration of Vim doesn't really matter anymore because I'm just conjuring the state of the code. I'm not typing it. But I am landing a lot of code — a little bit internally and then a lot externally, because I'm still trying to figure out what's actually going on.

Will (49:06.38)
The question I'd like you to ask is how often am I landing code that I didn't write or review? That's something I'm pushing on a lot in a lot of places. I have agentic loops I'm trying to iterate on GitHub. And I'm increasingly trying to step back and optimize the process that is producing the software — and expect that it's my job to make sure it's safe to land. The count I'm actually thinking about is how many changes to these code bases are happening that I did not artisanally inspect if not artisanally type.

DNR (49:53.32)
Artisanal code generation, I love it.

Will (49:56.38)
I am from Portland, so everything is a little bit artisanal.

Alex (50:01.586)
If we think of the fully CI/CD version of AI as: we are producing outcomes without a huge amount of human oversight that are producing value, not dramatically increasing technical debt, and not removing our ability to understand what we do — if those are the three bounds, how much of that are we doing? Because that's probably a true measure of how close we are to the escape velocity we're looking for.

Will (50:33.314)
If I came on here and explained all the ways I'm inspecting the binaries I'm producing, you'd tell me to get off this podcast. We'll be in that world — or rather, we'll get past that world. I think it's important now to try to make a binary, get the compiler to produce the output and run it. And as intuitive as that is for us in some contexts, extending that intuition to the full software production process is the current problem.

Alex (51:05.627)
We'll call it the Will question.

Will (51:10.606)
Well, thank you. I really appreciate the opportunity to kick off the raw season. And I'm just glad folks are trying to dig in and think through what is happening now. And I hope everything on this edition is like totally invalid next week.
