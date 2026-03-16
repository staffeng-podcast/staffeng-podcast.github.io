---
title: "I Haven't Opened an IDE Since November"
date: 2026-03-16T00:00:00.000Z
key_quote: "AI is like the closest to magic we've ever had. There is no difference between the idea and the solution in front of you."
slug: "i-havent-opened-an-ide-since-november"
guests: ["Karynn Ikeda"]
---

{{< youtube 52cZCc7Sy3c >}}

<div id="buzzsprout-player-18827390"></div><script src="https://www.buzzsprout.com/1687069/episodes/18827390-i-haven-t-opened-an-ide-since-november-will-maier.js?container_id=buzzsprout-player-18827390&player=small" type="text/javascript" charset="utf-8"></script>

Karynn Ikeda is a former engineering manager at BabyList—a baby registry and shop for growing families—who spent the last year leading AI adoption across her team and the broader engineering org. In this episode, she talks through how an entire organization shifts from "ChatGPT for everything" to agentic coding, what it takes to bring non-engineers into the codebase, and why she's barely touched an IDE in months.

## From ChatGPT to Claude Code

Like most companies, BabyList's AI journey started with everyone jumping on ChatGPT in 2024. The real shift came with the Shopify memo in early 2025, when their CTO decided engineers needed to actually use specialized coding tools—Cursor, Windsurf, whatever—rather than just chat interfaces. No single tool was mandated. The goal was exposure.

Karynn ran a six-week pilot with her team, requiring them to use Windsurf exclusively instead of their usual VS Code or RubyMine setups. The first three weeks were rough: complaints about key bindings, confusion about what was different from regular VS Code. Then something shifted. Engineers got better at prompting, better at knowing when to use autocomplete versus when to actually have a conversation with the model. By week six, even the most skeptical person on the team was recommending broader rollout.

> Going from code completion to chat is a mindset shift on its own. And then going from that to agents is *yet another* mindset shift. You're kind of pulling people slowly along the way on that journey.

By Q4 2025, the majority of engineers were producing at least one agentic PR per week, and the org had largely converged on Claude Code—not by mandate, but because most engineers were already choosing Anthropic's models inside Cursor and Windsurf anyway.

## What Actually Moved the Needle

A few things worked particularly well:

**Daily async check-ins.** During the pilot, Karynn asked the team in Slack every day: what's working, what's not? She'd dig into Windsurf documentation to answer questions herself, acting as a resource so engineers didn't have to stop and do their own research.

**A vibe-coding hackathon.** At their annual engineering offsite in Chicago, she ran an hour-long session where the goal was to build a simple browser game using AI tools. Results were mixed—some people were exactly where they started, others were floored by what they'd shipped in an hour—but it gave the whole org a shared reference point.

**Staff engineers leading adoption.** A working group of staff engineers owned the key decisions: what context management system to build, how to survey the org, which best practices to document. One staff engineer literally went around and interviewed engineers about their workflows to distill what was working. Having peers lead this, not just leadership, made the difference.

**Measuring sentiment, not velocity.** Rather than trying to build elaborate productivity dashboards, BabyList just asked engineers weekly: how confident are you that AI can take you most of the way on a backend change? A frontend change? This sidestepped the endless measurement debate and gave them a signal that was easy to track and iterate on.

## Onboarding Non-Engineers to the Codebase

The initiative Karynn is most excited about right now is getting product managers and designers actually writing code—or at least directing agents to write it. They recently ran a workshop trying to onboard 30 people onto the dev environment using a Claude Code skill (formerly called a plugin). Even with a standardized skill, the agent onboarded people in slightly different ways, causing troubleshooting headaches at scale. That experience crystallized why evals matter: you need deterministic guarantees that the agent is using Homebrew the same way every time, not just vibes.

The most energizing part of this work, for Karynn, is watching a designer who's never touched code go completely wild on the iOS app—making visual changes that engineers would never prioritize, feeling genuinely empowered. Non-technical people coming from creative backgrounds need the same thing junior engineers need: encouragement, confidence, and someone pairing with them until they trust themselves.

> I've almost forgotten what it felt like to be brand new to coding. Working with her, it comes back. She is just having so much fun and feeling really empowered. It's infectious.

## Where Things Are Headed

A few themes Karynn sees shaping the next year:

**Agent orchestration as the new bottleneck.** The goal at BabyList is that engineers won't be writing code themselves—agents will write everything, with engineers reviewing PRs. The focus is now on managing multiple agents running in parallel, and that's a genuinely new skill set.

**Personal software as a category.** One engineer on the team built his own voice interface to Claude Code: agents narrate when they're done, read back the issue, take verbal instructions, switch between sessions on command. He built this entirely in time he wasn't spending coding. It's genuinely futuristic, and it's happening now.

**Voice as the next paradigm.** Karynn's sister-in-law has a five-year-old who gets up on weekends and interrogates Alexa about basketball stats on his own. The next generation will grow up talking to computers—not as a novelty, but as the default. That means everything we design for GUIs is going to need rethinking.

## Advice for Junior Engineers

Don't just use the tools—ask them to explain what they're doing and why. The critical thinking has to stay in the loop, and for people early in their careers, building that judgment through AI feedback might look very different from how senior engineers built it. But the underlying principle is the same: learn through feedback. The source of that feedback has just changed.

---

*Karynn Ikeda is leading AI enablement for engineering, product, and design at BabyList. You can follow her work and thinking as she figures out what this new role actually means.*
