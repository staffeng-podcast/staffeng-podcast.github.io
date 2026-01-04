---
title: "Jam Leomi (Honeycomb)"
date: 2021-04-13T09:00:00-0500
draft: false
aliases:
  - /1687069/episodes/8303908-jam-leomi-honeycomb
key_quote: "One of the things I'm having to get used to now, especially growing into my role, is that some of the stuff I just have to delegate and not everything is up to me to take on to fix."
---

Today we are joined by the inspiring Jam Leomi, who is currently the Lead Security Engineer at Honeycomb. Jam has worked in tech for over ten years, holding positions in both operations and security, and we get to hear about some important milestones in their journey thus far. Jam gives us some great insight into how things work for engineers at Honeycomb, talking about expectations and priorities, and the way they currently split their time between different parts of the job. We also discuss OKRs, communication practices, and how Jam aligns personal goals and values with those of an organization. Listeners get to hear about measuring the success of security practices, strategies for effective rollout, and the task of navigating organizational politics. To finish off this great episode, Jam shares some of the things that have influenced them along the way, from books and blog posts to colleagues and mentors. Make sure to listen in with us on the StaffEng podcast today!  
  
**Links**

- [Jam Leomi on Twitter](https://twitter.com/jamfish728)
- [Honeycomb](https://www.honeycomb.io/)
- [Erica Joy on Twitter](https://twitter.com/EricaJoy)
- [*Accelerate*](https://www.amazon.com/Accelerate-Software-Performing-Technology-Organizations/dp/1942788339)
- [*The Manager's Path*](https://www.amazon.com/Managers-Path-Leaders-Navigating-Growth/dp/1491973897)
- [Last Week in AWS](https://www.lastweekinaws.com/)
- [Charity.WTF](https://charity.wtf/)

## Listen

[Download Episode](https://www.buzzsprout.com/1687069/episodes/8303908-jam-leomi-honeycomb.mp3)

## Transcript

David: Welcome to the Staff Eng podcast where we interview software engineers who have progressed beyond the career level into staff levels and beyond. We're interested in the areas of work that set staff plus level engineers apart from other individual contributors. Things like setting technical direction, mentorship and sponsorship, providing engineering perspective to the org, etc. My name is David Noel Romos and I'm joined joined by my co host, Alex Kessinger. We're both staff engineers who have been working in software for over a decade. Alex, please tell us a bit about today's guest.

Alex: I'd be delighted to. Jam Leomi is a lead security Engineer@Honeycomb IO. Before that, they worked in tech for more than 10 years in both ops and security roles. I always relish the opportunity to talk to security folks. So let's get right into the interview.

David: Jam, thanks so much for taking the time to do this with us today. And a good place to start would be for you to just introduce yourself, tell us a little bit about your current role and what led you to that point in your career.

Jam: Hi, my name is Jam Leomi. I am the lead security Engineer@Honeycomb IO. And what led me to this gig is really that I was searching to do more leadership y stuff and Honeycomb came at me and it was one of those companies where I was waiting for them to actually have an opening and they had all the qualities that I was looking for in a company. Like, as you get further along in your career and you get more senior, you start to have certain things that you want more than just the work. And the work's important, but it's not the, like the overarching factor. So for me it was like good people and what the role would offer me, but like the people and what the product did and how impactful it was was super important to me. So that's the reason I kind of ended up where I was at in the short part of it, the long one. Well, you can keep asking me questions for that.

Alex: Awesome. That's really good to hear. So at Honeycomb, are there like engineering levels? At Honeycomb?

Jam: Yes, there are.

Alex: For your role and your level, is there like a typical approach, typical expectation of an engineer?

Jam: I think the typical expectation is that you're kind of the authority on things. Like for principal engineers at Honeycomb, you kind of are the head of your domain in a sense, and also a lead in kind of your own right. So you do have that autonomy, but you're also required to collaborate and work with other people and kind of be that person. To answer some questions. So, like, for me it's very, very unique because there's not a whole lot of people, at least that I can see in my position. And it's also unique because unlike, you know, many of the other principal engineers, my impact is company wide. So a lot of questions I get are not just from engineering or not just from sales. Like, it's from sales, it's from customer success, it's from hr, it's from finance, it's from engineering as well. Because pretty much security touches so many things.

Alex: Yeah, that's cool. It sounds like you have a wide impact. Is there something that you feel like you can do in your role as principal that you wouldn't have been able to do, you know, as a less experienced engineer?

Jam: I think the thing as a less experienced engineer is kind of seeing how you need to shift with the growth of a company. I think that's something that just takes time and experience to learn, like knowing, okay, when the company is growing to this level, here's how you need to shift or here's how you need to balance it. I think early on there was more trial and error, and there still is trial and error, but there was much more. And then probably the second thing is just knowing how to influence people and have those hard conversations, but also like learning the balancing act of compromising and not compromising.

David: That makes sense. I want to get back to the idea of sort of influencing folks around you in a bit, but before we get to that, I'm curious about sort of like the day to day of your role. And specifically what portion of your time do you spend working on sort of executing specific projects versus team oriented or organizational oriented work like planning, training, recruiting, mentoring, etc.

Jam: Right now it's kind of a balance between the two and it changes every day. Right now because I'm a team of one. There isn't a ton of like day to day mentoring, but instead that mentoring comes in the form of people asking me a lot of questions. Like one of the things I'm having to get used to now, especially growing into my role, is that some of the stuff I just have to delegate and not everything is up to me to take on to fix, especially in security. Like some people just need that gut check that everything is okay like to do. And luckily the current company I work at, we have a lot of smart people, they know the basics of security and the things not to do and know to ask first at least to do a gut check.

David: How do you decide what to work on? Is it largely sort of things coming to you, or is there sort of an element of exploring and finding things that you think are important to work on?

Jam: Half of it is things coming to me, and the other half is things I kind of want to work on.

David: Right.

Jam: More often than not, the people coming to me is more often than the things I want to work on.

David: Got it. Got it. Is there a process within the organization? So you mentioned, for instance, that you act as a sounding board for a lot of security questions. My guess is that Honeycomb is still at the size where a lot of that is pretty informal. Like someone pings you and says, hey, I want to ask you about this thing, or is there like a more sort of formal process set up for sort of getting. Getting your review on something?

Jam: You have to keep in mind that I've only been at Honeycomb for six months. At other places, I have had more formal ways of people asking me, but sometimes the informal just checks out with more people and it's more personable. So I tend to take either.

David: In the portion of your work where you're driving projects that you sort of identified as being important, do you have any processes around sort of communicating out, like the progress on your work? You mentioned that you're sort of a team of one right now, so I imagine that's even in some ways more interesting. Like, you probably want to still make sure that you're maintaining visibility throughout the company.

Jam: Usually at companies I've tried to do good about giving email updates or usually orgs that I'm a part of will have, like, team updates that they'll do and I'll add to that.

Alex: One of the things that I feel like staff plus engineers do a lot of is sort of finding how to align with the organizational goals. And I was curious, like, how do you approach that with your organization, making sure that the work that you do is in alignment with your organization?

Jam: Well, for me, I really just always try to keep abreast or aware of what's going on in my organization as well as the business objectives and basically seeing how I can fit in, especially for security, like, what oftentimes you run into is that security isn't the top priority. And so in some situations, like, you kind of have to make do with that security, especially has to keep aware of business objectives so that they can align and that they can make those opportunities happen about getting that growth in for the org.

Alex: Yeah. Do you do any sort of formal measurement or OKRs or anything like that with the organization to make sure that you're in alignment.

Jam: Yeah, we just started doing those for security. I haven't built them out yet simply because, again, only been at Honeycomb for six months. But at previous companies I have, like, built out full roadmaps. Previously when I was at Splice, I pretty much did that of being like, okay, here's the roadmap and also here's the okrs for each quarter, like, planned down to the week. Yes, I have done that and usually try to align it with the business goals on what was needed. So, like, one of the things is, okay, we haven't gotten a pen test in a while. How about we do that?

Alex: When you approach sort of like measured goals, is there any sort of friction that you've experienced there as an engineer, like, finding a way to, like, measure your alignment?

Jam: Yes and no. I think what I've tried to explain, because with security, it's hard because you can't exactly say a metric with security because it's like, oh, no news is good news. I guess that's great. So usually you have to claim it either by impact or like a project completion. So, like, at my last company, it was, hey, did we get this benchmark and stuff cleaned up to match up with this benchmark completed? Cool. That was one way. And it's like, here's how much more secure we are and here's how much we're fixing or did we get this rollout accomplished? So it's more project heavy than metric heavy.

Alex: Yeah. It's hard to measure the negative. Right. We stopped 10 attacks this last quarter. So if you find maybe tech investment or parts of your process that you want to improve, how do you work with Cross Functional Partners to get that on their roadmap?

Jam: Well, usually the first thing is try to appeal across the board. At one of the companies I was a part of, one of the things we were dealing with was a password management system. We all knew it was a problem. We all knew it needed to get fixed. Doing the research and being like, here's our possible options. What do you think? So that's one example. Another example is I worked at another company where we had, I think within the first month of me joining, they wanted a new alternative to vpn. And again, that was across the board. The VPN solution they were using was terrible to the point where, you know, some engineers couldn't do their jobs. So, like, finding the common thing of, oh, this needs to get fixed, and using that as an opportunity to find improvements and being like, what new tooling can we introduce and put in and also like keep in mind, like maybe the company may not have enough money for that or maybe they want to test this out to see if it works and see the most optimal solution. So I feel like the best way to start with it is being like, what is a major problem that everyone has and that is visible.

David: Right. With projects like that, like a password manager or a vpn, what strategies have you seen work well for sort of driving the rollout? Right. Like I think oftentimes if an organization is of sufficient size, it's sort of like you can't just flip it on one day. Like there's sort of a little bit of strategy that needs to go into it to make sure that you're sort of like communicating about it properly and you know, maybe doing a gradual rollout or whatever the case may be. What strategies have you seen work there?

Jam: Searching for opportune testing grounds I think is a huge thing to do. For the VPN option, they were using VPN for this new ui, but they needed to share with external parties and with the VPN system that wasn't possible for that project specifically, it was a good testing ground to figure out, okay, how can we make this visible to external parties, parties outside of engineering. For me, I took the first two weeks of my job to just of that job to just figure out how to roll out a kind of duo like system using saml. Auth and I tried several different SAML solutions before laying on one and then rolling it out to that new ui.

David: Right, right. So you had sort of a new use case that you could try with the new system kind of entirely and then once you sort of proved it there, then you could rol to other places.

Jam: Yeah, so that's one of the ways of doing it for other things that are vendor heavy, that are like more encompassing. Usually having training beforehand before the change happens and letting people know what to expect. Like I've rolled out new IT solutions which can always be a bear to roll out to people because they're like, what are you doing to my machine? If you are transparent about it, like here's what's going to happen with your machine, here's what to expect. Yes, this is normal. Even afterwards when you repeat yourself it's like, yes, this is normal. And like setting the tone of like this is going to happen, letting people know ahead of time again like emailing people, slacking people, letting them know of timelines of here's how this is going to happen, here's what time it's going to happen. And then afterwards, especially, like with security IT Solutions, ensuring that people know the progress that's being made. Like, okay, we have 25% of the company, like 40%, 50% and so on. So, yeah, it's either finding opportunities to have a testing ground and then communicating to people that the change is happening and what to expect.

David: That makes sense. I'm curious to what extent you feel that navigating organizational politics is a part of your job, and if so, how do you navigate it?

Jam: Navigating politics is a huge chunk of my job. I feel like as you get higher up in engineering, in your career, that it just becomes more of a cognizant thing. I feel like sometimes it's just inescapable. So I've tried my best to just roll with it. And also, knowing office politics and the power dynamics also lets you know, hey, it's time to tap out of this job or not.

David: Yeah, fair enough. What are some of the factors there? Like, which situations do you think are sort of like, hey, this is just like, sort of the normal type of politics that I got a roll with and, like, maybe try to influence. And then what are some of the things where it's like, nope, nope, nope, I'm out.

Jam: I actually posted this on Twitter. Like, I think either this week or last week, about one of my red flags is when they bring in a new C level and the C level brings in his. His buddies, right? Quote, unquote. And it doesn't happen in all the cases, but usually in most of the cases, when a C level order exec brings their buddies in, it creates this power vacuum where it either pushes out or burns out the people that are making the company run. Like, the engineers that are making the company run. Like, that's something that I usually keep in mind. Now, like, in terms of politics, where it's like, we're gonna do this because, like, especially at sea levels, when there's a shift at the top like that, it can change the power dynamics, it can change what's being done, it can change your work being done. That is one thing I do keep an eye on, especially.

David: Yep, that makes sense. Are there other situations where it's like, no, this is kind of like to be expected, you know, this is like, this is how organizations make decision decisions. Sometimes there's politics and like, in those situations, sort of, how do you try to fit yourself into it and how do you try to influence the conversation?

Jam: I think when reorgs happen or when people are let go, right? And those are huge changes and they can also be emotionally devastating. But it is also something that happens at companies. Sometimes companies lose money and they can't keep the people that they need to. Or sometimes they have to reorg because they need to move people around. I've kind of learned to roll with because that's just part of how businesses run, especially in the startup land.

David: Yeah. Do you have any sort of tools for navigating that? Especially maybe like when it comes to sort of if there's a team that you're working with or folks that are sort of looking up to you?

Jam: That is a really good question. One of the things that I've learned from past experiences for this is just being able to hold space for people when it happens, because some people are not going to be able to deal. And by being able to kind of hold space for venting or whatever needs to happen, like for the people who are still there, is beneficial. I appreciated that when it happened at a previous company one time, leadership was very, very keen on being like, okay, what's being engaged on the people still here? Are they feeling okay? Like, you know, are they feeling heard? Like, what's going on? And I appreciate that, that space being held.

David: One of the challenges that I've had is when there's a sort of an organizational transition coming. Oftentimes we're in positions where we sort of know that it's coming ahead of time before it's folks. And then I find there's sort of this. It doesn't feel super authentic. Well, I don't always know how to. How to behave in those situations. Like, you know, other people are absorbing news that I've already known for a little while and it's hard for them. And so when you think about making space, like, do you have any thoughts on sort of the right way to engage with folks that are sort of absorbing the news often, or at least in some cases, sort of news that you've already known was coming.

Jam: Really just reminding yourself that you've already had the news for a bit and that you may have already processed some of the feels that you may have. For me, it's kind of different because I have my own kind of internal processing and I usually try to not let work things hit me as hard. But I know for some others they have their own process of things. And so I think it's kind of having empathy of what the other person may be feeling at the time. And keeping that in mind, this isn't.

David: Just specific to the context of navigating an organizational change, but in General, how do you think about the difference between our role as technical leaders and management?

Jam: I feel like management is a whole different ball game simply because we've been talking a lot about holding space. You're holding a lot more space for people engaging how they're doing, how they're feeling. Like you have to gauge how they're doing their projects. Like how they're doing in general, holding their career growth. Not entirely, but there's bits and pieces that you hold, and this is on top of managing projects that may be happening. The politics of stuff, it's very, very different than being an. I see. Even if it's principal or staff level.

Alex: Interesting. Have you ever considered going the management track? You know, going to the other side?

Jam: Oh, yeah, I totally have. Like, that is because for me, that is one of the stepping stones to get to executive leadership, which is one of my goals. And I still realize that it takes a lot of work and a whole lot more than what I'm currently doing in my role.

Alex: I was reflecting on the idea that we were talking about how these are different jobs, they take different expertise, but would imagine that we recognize that they both are valuable for different reasons. I'm curious, having considered going the engineering manager track, what kind of work do you feel like you can achieve as a senior IC that maybe you wouldn't be able to achieve as a senior engineering manager?

Jam: Pretty much right now I'm able to get some projects done. I don't think as a manager, you're. You're able to get any done within a workday. I've seen my manager's calendar.

Alex: It's a lot given that, like, senior ICs maybe have a little bit more time than engineering managers. Is sponsoring other engineers like, an important aspect of your role?

Jam: Oh, yeah, definitely. And that's something that I hope to do, especially as this role grows and as security parts of engineering grow.

Alex: Do you have a particular approach that you've used or that you're looking forward to using?

Jam: One thing I love is having kind of game days to kind of teach people security skills. Like, at my last job, one of the things I did to kind of. I used it twofold. One to teach people a skill, which was threat modeling, and the other to glean, okay, what are problems that the engineers are seeing that I'm not? And so we played a game called Escalation of Privilege, which is basically setting out, what does our infrastructure and app look like now? Tell me the problems with it using these cards. Yeah, no, it was super cool. And it allowed Me to glean a lot. Like, I ended up playing with two separate groups of engineers, and not only did they know how to think of what are the problems that you may not even think about, but also just again, it helped me learn too, from the context of other engineers.

Alex: So, like, outside of the maybe like, leveling people up in their. In their skill set, do you engage in any sort of, like, mentoring in your role at all?

Jam: I used to at my previous jobs. Not yet for this one, though. I'm hoping that to be more so in the coming months. Cool.

Alex: In your previous roles, how do you seek to help?

Jam: Through mentorship, basically, Again, going back to that holding space for mentors to ask questions of being like, how do I do this? How do I do that? I feel like a lot of times, especially with me coming up, there wasn't that space to ask questions or be like, why isn't this working? It was usually just read the manual, and sometimes you don't need the manual, the manual to be read. Sometimes they just need a hand, or as somebody put it, for lack of a better word, sometimes you need just somebody to help you kind of pull the trigger. You know, sometimes you need that help to, like, actually do the thing and have confidence that doing the thing will go right. So, like, holding space for somebody to have success is super important. And, like, a lot of things, you know, that includes like, pairing with a person and being like, let's go through terraform code together and figure out how this work is working and what, you know, what troubleshooting steps that you need to do and also helping, you know, people with their careers and stuff. So, like, some mentorship I've done, it's more than just questions. It's sometimes on career direction on where should I go, what should I be learning, or can you look at my resume and clean it up a bit? It's kind of been all over the place in terms of mentorship. But I think the big thing again is holding space and helping your mentor succeed.

Alex: That sounds like a very great way to be impactful and helpful. One of the things I was thinking about as you've talked a lot about holding space, and I feel like you're sort of talking about leaving rooms for the sort of emotional side of our job. And one of the things that I think when I think about security is oftentimes it's like maybe my least skilled area, and it might be for a lot of engineers, because it's so technical, there's just so much stuff to learn that I might even feel sheepish or I might feel it might be hard for me to talk about security. Is there anything that you do as a security leader in your company or companies to like, give people the space to come and talk to you about security?

Jam: I always just leave an open door. This is one of the reasons why if people come at me with questions, I don't have them go through a formal process simply because I want them to be able to ask me questions and give me the proper context of the question. But I try to always leave the door open. I try to always. When I'm sending out communications, if people have questions, I'm like, if you have any questions, please feel free to reach out to me. I also try to make myself approachable. I'm not just a security engineer, I am a person. I try to talk with my coworkers about other things outside of security, things that I enjoy, things that I like. One of the big things about me is building those relationships and building those connections. That way people don't feel sheepish because they know me.

Alex: Nice. Do you feel like exercises like you talked about previously, where you're like playing a game with someone, do you feel like that makes it easier for someone to come to you in the future and talk to you about security?

Jam: Oh, yeah, totally. That definitely helped more people come to me with security questions and also helped kind of establish me as the authority at that company too.

Alex: Do you have a systemic approach at all to one on ones or anything like that?

Jam: No, I actually don't. That's like one of the one things that I'm kind of building for that one. I try to let it flow organically unless there's something specific that needs to be talked about.

Alex: Cool. It sounds like one on ones, though, are something that you do. It just happens organically.

Jam: Organically or. I know with leadership, I try to have one on ones consistently. I know with our team growing and also some recent stuff internally, it's kind of fallen to the wayside this month. But I hope to pick it back up next month because it's something that really keeps me in tune and in touch with the rest of the company.

David: That makes sense. What kind of cadence do you use for your one on ones? And like you mentioned, sort of with leadership, how do you decide who to have your one on ones with throughout the org?

Jam: Well, the first one is my manager, simply because I always want to stay in sync with them, especially because they are the VP of engineering. But for other people, it depends on whether I'm working with them on A project or whether I want to stay and seek with them on stuff. Back when I was first starting, I had like weekly check ins with managers simply because I wanted to get up to speed. And one of these managers had been at Honeycomb for a while, like since the founding. So it was just like, okay. And the other one was with an onboarding buddy, which was also weekly for me. Now, like what I hope to pick back up because our team has grown so much and we have more managers and I only have so much time, it might be more widened out to like maybe every other week with each manager or once a month.

David: Yep.

Jam: Cool.

David: Who are some people that have influenced your approach to work or that you've learned from throughout your career?

Jam: I think one of the first examples I had of somebody who looks like me in the industry that I could look up to was Erica Baker, who's Erika Joy on Twitter. She was actually one of the first black engineers that I like, saw when I was interning at Google. Which was funny because the reason why I noticed her is because we got confused with each other while I was interning.

David: So sure, that's cool. I'm aware of Erica's work. That's. That's pretty neat. Are there any blogs or books that have influenced your approach to work?

Jam: Accelerate. I love that.

David: Oh yeah, that's an awesome book. Accelerate by Jez. Humble, right?

Jam: Not just Jez, but also Nicole.

Alex: Nicole Forsgren, PhD.

Jam: Mm. Thank you. But absolutely love that book and the practices that it puts out. Other book for me that's been kind of helpful on my path is the manager's path. I actually really enjoyed that book in terms of reading and kind of giving me an idea of, okay, what does leaders at various roles look like?

David: Camille Fournier, right?

Jam: Yep. I love the last week in AWS blog post that gives me all the News. Also our CTO's blog, charity. WTF.

Alex: Yeah.

Jam: Because I feel like she gives some really good insights, especially making it okay for people. Like, I love the manager to IC cycle and how she talks about that. Because I feel like before she posted that I think it wasn't okay to consider, hey, maybe I just want to go back from being a manager.

David: Awesome article. It's influenced the way I think about it, for sure.

Jam: Yeah. And I think it's made it more comfortable for people to make that transition without feeling shame about it or like, you failed.

Alex: Yeah. Did you follow Charity Majors before you joined Honeycomb?

Jam: Oh yeah. Like I've been following her since there was an sre con. A few years ago that I went to in Dublin. Dublin, Ireland. I've been following her since then.

Alex: I'm curious, you know, Senior, I see lots of influence, lots of meetings. You've got a lot to do, you know. How much time do you still spend coding?

Jam: I'd rather not say.

Alex: Sounds good.

David: That's our final question for everybody. We always got to get that in there. Well, Jen, thank you so much for taking the time again. It was really, really a pleasure to chat with you today.

Jam: Absolutely a pleasure to chat with y' all as well.

Alex: It's nice to meet you.

David: That's it. Thanks so much for listening to staff Eng. If you enjoyed today's show, please consider adding a review on itunes, Spotify, or your podcaster of choice. It helps others find the show and is a really useful signal to us that folks are finding value in this so that we keep doing it.

Alex: You can find the notes from today's episode episode at our website, podcast.staffenge.com the website also has our contact info. Please don't be shy.