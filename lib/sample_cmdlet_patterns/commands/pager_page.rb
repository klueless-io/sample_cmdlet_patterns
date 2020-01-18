# frozen_string_literal: true

require_relative '../command'

require 'tty-config'
require 'tty-prompt'
require 'tty-markdown'

module SampleCmdletPatterns
  module Commands
    # Terminal output paging - cross-platform
    class PagerPage < SampleCmdletPatterns::Command
      def initialize(options)
        @options = options
      end

      # Execute PagerPage subcommand taking input from
      # a input stream and writing to output stream
      #
      # sample: output.puts 'OK'
      def execute(input: $stdin, output: $stdout)
        markdown = <<-MARKDOWN
# Best Practices for Event-Driven Microservice Architecture

If you’re an enterprise architect, you’ve probably heard of and worked with a microservices architecture. And while you might have used REST as your service communications layer in the past, more and more projects are moving to an event-driven architecture. Let’s dive into the pros and cons of this popular architecture, some of the key design choices it entails, and common anti-patterns.

What is Event-Driven Microservice Architecture?

---

In event-driven architecture, when a service performs some piece of work that other services might be interested in, that service produces an event - a record of the performed action. Other services consume those events so that they can perform any of their own tasks needed as a result of the event. Unlike with REST, services that create requests do not need to know the details of the services consuming the requests.

Here’s a simple example: When an order is placed on an ecommerce site, a single “order placed” event is produced and then consumed by several microservices:

1. the order service which could write an order record to the database
2. the customer service which could create the customer record, and
3. the payment service which could process the payment.

Events can be published in a variety of ways. For example, they can be published to a queue that guarantees delivery of the event to the appropriate consumers, or they can be published to a “pub/sub” model stream that publishes the event and allows access to all interested parties. In either case, the producer publishes the event, and the consumer receives that event, reacting accordingly. Note that in some cases, these two actors can also be called the publisher (the producer) and the subscriber (the consumer).

[](#why-use-eventdriven-architecture)Why Use Event-Driven Architecture

---

An event-driven architecture offers several advantages over REST, which include:

- Asynchronous – event-based architectures are asynchronous without blocking. This allows resources to move freely to the next task once their unit of work is complete, without worrying about what happened before or will happen next. They also allow events to be queued or buffered which prevents consumers from putting back pressure on producers or blocking them.

- Loose Coupling – services don’t need (and shouldn’t have) knowledge of, or dependencies on other services. When using events, services operate independently, without knowledge of other services, including their implementation details and transport protocol. Services under an event model can be updated, tested, and deployed independently and more easily.

- Easy Scaling – Since the services are decoupled under an event-driven architecture, and as services typically perform only one task, tracking down bottlenecks to a specific service, and scaling that service (and only that service) becomes easy.

- Recovery support – An event-driven architecture with a queue can recover lost work by “replaying” events from the past. This can be valuable to prevent data loss when a consumer needs to recover.

Of course, event-driven architectures have drawbacks as well. They are easy to over-engineer by separating concerns that might be simpler when closely coupled; can require a significant upfront investment; and often result in additional complexity in infrastructure, service contracts or schemas, polyglot build systems, and dependency graphs.

Perhaps the most significant drawback and challenge is data and transaction management. Because of their asynchronous nature, event-driven models must carefully handle inconsistent data between services, incompatible versions, watch for duplicate events, and typically do not support ACID transactions, instead supporting [eventual consistency](https://en.wikipedia.org/wiki/Eventual_consistency) which can be more difficult to track or debug.

Even with these drawbacks, an event-driven architecture is usually the better choice for enterprise-level microservice systems. The pros - scalable, loosely coupled, dev-ops friendly design - outweigh the cons.

[](#when-to-use-rest)When to Use REST

---

There are, however, times when a REST/web interface may still be preferable:

- You need a synchronous request/reply interface
- You need convenient support for strong transactions
- Your API is available to the public
- Your project is small (REST is much simpler to set up and deploy)

[](#your-most-important-design-choice-messaging-framework)Your Most Important Design Choice – Messaging Framework

---

Once you’ve decided on an event-driven architecture, it is time to choose your event framework. The way your events are produced and consumed is a key factor in your system. Dozens of proven frameworks and choices exist and choosing the right one takes time and research.

Your basic choice comes down to message processing or stream processing.

### [](#message-processing)Message Processing

In traditional message processing, a component creates a message then sends it to a specific (and typically single) destination. The receiving component, which has been sitting idle and waiting, receives the message and acts accordingly. Typically, when the message arrives, the receiving component performs a single process. Then, the message is deleted.

A typical example of a message processing architecture is a Message Queue. Though most newer projects use stream processing (as described below), architectures using message (or event) queues are still popular. Message queues typically use a “store and forward” system of brokers where events travel from broker to broker until they reach the appropriate consumer. [ActiveMQ](https://activemq.apache.org/) and [RabbitMQ](https://www.rabbitmq.com/) are two popular examples of message queue frameworks. Both of these projects have years of proven use and established communities.

### [](#stream-processing)Stream Processing

On the other hand, in stream processing, components emit events when they reach a certain state. Other interested components listen for these events on the event stream and react accordingly. Events are not targeted to a certain recipient, but rather are available to all interested components.

In stream processing, components can react to multiple events at the same time, and apply complex operations on multiple streams and events. Some streams include persistence where events stay on the stream for as long as necessary.

With stream processing, a system can reproduce a history of events, come online after the event occurred and still react to it, and even perform sliding window computations. For example, it could calculate the average CPU usage per minute from a stream of per-second events.

One of the most popular stream processing frameworks is [Apache Kafka](https://kafka.apache.org/). Kafka is a mature and stable solution used by many projects. It can be considered a go-to, industrial-strength stream processing solution. Kafka has a large userbase, a helpful community, and an evolved toolset.

### [](#other-choices)Other Choices

There are other frameworks that offer either a combination of stream and message processing or their own unique solution. For example, [Pulsar](https://pulsar.apache.org/), a newer offering from Apache, is an open-source pub/sub messaging system that supports both streams and event queues, all with extremely high performance. Pulsar is feature-rich - it offers multi-tenancy and geo-replication - and accordingly complex. It’s been said that Kafka aims for high throughput, while Pulsar aims for low latency.

[NATS](https://nats.io/) is an alternative pub/sub messaging system with “synthetic” queueing. NATS is designed for sending small, frequent messages. It offers both high performance and low latency. However, NATS considers some level of data loss to be acceptable, prioritizing performance over delivery guarantees.

[](#other-design-considerations)Other Design Considerations

---

Once you’ve selected your event framework, here are several other challenges to consider:

- Event Sourcing

  It is difficult to implement a combination of loosely-coupled services, distinct data stores, and atomic transactions. One pattern that may help is [Event Sourcing](https://martinfowler.com/eaaDev/EventSourcing.html). In Event Sourcing, updates and deletes are never performed directly on the data; rather, state changes of an entity are saved as a series of events.

- CQRS

  The above event sourcing introduces another issue: Since state needs to be built from a series of events, queries can be slow and complex. Command Query Responsibility Segregation ([CQRS](https://www.martinfowler.com/bliki/CQRS.html)) is a design solution that calls for separate models for insert operations and read operations.

- Discovering Event Information

  One of the greatest challenges in event-driven architecture is cataloging services and events. Where do you find event descriptions and details? What is the reason for an event? What team created the event? Are they actively working on it?

- Dealing with Change

  Will an event schema change? How do you change an event schema without breaking other services? How you answer these questions becomes critical as your number of services and events grows.

  Being a good event consumer means coding for schemas that change. Being a good event producer means being cognizant of how your schema changes impact other services and creating well-designed events that are documented clearly.

- On Premise vs Hosted Deployment

  Regardless of your event framework, you’ll also need to decide between deploying the framework yourself on premise (message brokers are not trivial to operate, especially with high availability), or using a hosted service such as [Apache Kafka on Heroku](https://www.heroku.com/kafka).

[](#antipatterns)Anti-Patterns

---

As with most architectures, an event-driven architecture comes with its own set of anti-patterns. Here are a few to watch out for.

- Too much of a good thing

  Be careful you don’t get too excited about creating events. Creating too many events will create unnecessary complexity between the services, increase cognitive load for developers, make deployment and testing more difficult, and cause congestion for event consumers. Not every method needs to be an event.

- Generic events

  Don’t use generic events, either in name or in purpose. You want other teams to understand why your event exists, what it should be used for, and when it should be used. Events should have a specific purpose and be named accordingly. Events with generic names, or generic events with confusing flags, cause issues.

- Complex dependency graphs

  Watch out for services that depend on one another and create complex dependency graphs or feedback loops. Each network hop adds additional latency to the original request, particularly north/south network traffic that leaves the datacenter.

- Depending on guaranteed order, delivery, or side effects

  Events are asynchronous; therefore, including assumptions of order or duplicates will not only add complexity but will negate many of the key benefits of event-based architecture. If your consumer has side effects, such as adding a value in a database, then you may be unable to recover by replaying events.

- Premature optimization

  Most products start off small and grow over time. While you may dream of future needs to scale to a large complex organization, if your team is small then the added complexity of event-driven architectures may actually slow you down. Instead, consider designing your system with a simple architecture but include the necessary separation of concerns so that you can swap it out as your needs grow.

- Expecting event-driven to fix everything

  On a less technical level, don’t expect event-driven architecture to fix all your problems. While this architecture can certainly improve many areas of technical dysfunction, it can’t fix core problems such as a lack of automated testing, poor team communication, or outdated dev-ops practices.

[](#learn-more)Learn More

---

Understanding the pros and cons of event-driven architectures, and some of their most common design decisions and challenges is an important part of creating the best design possible.


If you want to learn more, check out this [event-driven reference architecture](https://devcenter.heroku.com/articles/event-driven-microservices-with-apache-kafka), which allows you to deploy a working project on Heroku with a single click. This reference architecture creates a web store selling fictional coffee products.

[![Curated Cofee](https://res.cloudinary.com/practicaldev/image/fetch/s--aZyskE3U--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://thepracticaldev.s3.amazonaws.com/i/sq0d80olj7mc20cxtlmw.png)](https://res.cloudinary.com/practicaldev/image/fetch/s--aZyskE3U--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://thepracticaldev.s3.amazonaws.com/i/sq0d80olj7mc20cxtlmw.png)

Product clicks are tracked as events and stored in Kafka. Then, they are consumed by a reporting dashboard.

[![Button Clicks](https://res.cloudinary.com/practicaldev/image/fetch/s--pu8ARtOb--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://thepracticaldev.s3.amazonaws.com/i/l59ja46lwxonkxeoxkfo.png)](https://res.cloudinary.com/practicaldev/image/fetch/s--pu8ARtOb--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://thepracticaldev.s3.amazonaws.com/i/l59ja46lwxonkxeoxkfo.png)

The code is open source so you can modify it according to your needs and run your own experiments.

        MARKDOWN

        parsed = TTY::Markdown.parse(markdown)

        pager.page(parsed)
        :gui
      end
    end
  end
end
