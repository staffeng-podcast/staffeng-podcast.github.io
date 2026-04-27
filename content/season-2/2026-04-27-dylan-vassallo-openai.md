---
title: "A look inside an engineering team @OpenAI with Dylan Vassallo"
date: 2026-04-27T00:00:00.000Z
key_quote: "A couple of years ago, I never would have talked about principle of least privilege with a recruiter or an HR business partner. But now those are terms I'm using with them—and that's fascinating to me."
slug: "dylan-vassallo-openai"
---

<iframe width="560" height="315" src="https://www.youtube.com/embed/YnDizMHo8CM?si=3hHkAJpMvVKRTLkZ" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

Dylan Vassallo is an engineering manager at OpenAI leading the People Innovation Labs team — an eng, product, and design team embedded within the People org, building AI-powered tools for recruiting, HR, internal comms, and the employee experience.

In this episode, Dylan talks about what it actually looks like to be an engineering team inside a frontier AI company, how non-engineers are becoming builders, and what the "graduation" process looks like when a prototype needs to become a production system.

## The Aha Moment

Dylan's clearest aha moment didn't come from a demo — it came from open enrollment. OpenAI built a chat-based Q&A system for HR policies inside their internal intranet, Open House. Dylan watched employees use it to make real healthcare benefit decisions. "It was something that a concept that had been around for a while, but it started to be really, really accurate and really kind of load-bearing for folks in these high-stakes decisions."

## 1000 Flowers Blooming

One of the stranger new realities at OpenAI: people who aren't engineers are just... building things. HR business partners, recruiters, ops folks — they show up with working dashboards and tools they made themselves. Dylan's reaction: "That's amazing. That's like a working dashboard."

He wants to let this happen. The cultural starting point matters: "This is an actively good thing. This is something that you want to encourage." But he's also clear that once something moves from a team of four people to the whole organization, a harder look is required.

## The Graduation Process

Dylan uses the word "graduation" to describe the transition from prototype to production. The threshold he watches for: when something wants to cross from team-level to org-level use.

At that point, the checklist expands:
- Security review (least privilege, blast radius)
- Reliability and hosting
- Documentation and branding — employees need to know what the tool does, its limitations, and where to get support
- Who fixes it when it breaks, and how fast

A concrete example: their feedback assistant (which helps engineers draft performance reviews using knowledge of OpenAI's levels and ladders) introduced a new dependency on Lattice, their performance management system. Because Open House is accessible over the public internet for onboarding reasons, that created a real security boundary. They ended up building a dedicated backend API to isolate the two systems. Classic principle of least privilege — but now applied to tools built by HR teams.

## The Form Filler Pattern

One pattern Dylan's team has found broadly useful: a "form filler" where the AI works through a schema — required fields, optional fields, valid options — by having a natural language conversation with you. Rather than staring at a form, you just talk. The system figures out what's missing and asks.

They use it for interview feedback, performance reviews, and HR transactions. "It's much more pleasant to be able to talk to this stuff in natural language and have it kind of fill in that schema for you."

## Managing the Edge

Dylan runs weekly demos on his team specifically so everyone stays calibrated on where Codex's capabilities actually are today — not last month. The edge moves fast enough that individual priors get stale quickly. Collective sharing is the mechanism: a shipped channel where people post what they shipped and how Codex helped, and an explicit "Internal AI Adoption Chatter" channel for cross-team workflow sharing.

The Slack-level insight: once you see your coworker have Codex fix something and the code is reasonable and it's ready to merge, you want to do that too.

## For the Skeptics

Dylan's reframe for engineers reluctant to let go: this is just another abstraction layer. You don't feel threatened by Python because you don't have to write assembly. Same logic. And if your role is outcomes-oriented — if you're measured on impact — then reaching for whatever accelerates you is the job.

For the ones who love the craft for its own sake: keep a nights-and-weekends project. "That's where you sort of express that. And that's a totally different flavor of engineering than what you might need to do in the workplace, and that's okay."

## Links

- Dylan on X: [https://x.com/dylanvee](https://x.com/dylanvee)
- OpenAI Codex: [https://openai.com/codex](https://openai.com/codex)
- Lattice: [https://lattice.com](https://lattice.com)
- Linear: [https://linear.app](https://linear.app)
- Workday: [https://workday.com](https://workday.com)
