# Lua Event Manager

> This is a WIP

A script to manage event handlers for text based events (like mq2events) and condition based events (like mq2react).

![](./images/eventfired.png)

# Overview

Lua Event Manager is intended to provide an alternative to `mq2events`, `mq2react` and one-off lua scripts being written for events.  

Rather than events with giant, difficult to read macro if statements, proper lua functions can be written to handle events instead.  

Rather than reacts with a YAML file that frequently gets corrupted or breaks from indentation mistakes, more complex conditions and actions can be implemented.

Event definitions are global and stored in a shared `lem/settings.lua` file. Editing events from multiple characters can overwrite changes if you aren't reloading before making edits on a character.  
Event enabled/disabled state is stored per character in a characters own `lem/characters/{name}.lua` file. Hopefully this allows to more safely enable or disable events across characters.

# Installation

Download the contents to your MQ Lua folder.

# Usage

Start the script with: `/lua run lem`

## Defining Event Categories

![](./images/categories.png)

Several example categories are pre-defined, and more can be added or removed from the `Categories` section.

## Managing Events

![](./images/textevents.png)

The `Text Events` and `Condition Events` sections provide controls for adding, editing and deleting events.

The event list can be filtered by name to help find the event you are looking for.

![](./images/eventfilter.png)

Full details of an event can be viewed by double clicking the row in the events table or clicking the `View Event` button.

![](./images/eventviewer.png)

## Adding Text Events

![](./images/eventeditor.png)

1. Select `Text Events` and click `Add Event...`.
2. Enter a name for the new event.
3. Enter a pattern for the new event. The pattern can include `#*#` for wildcard matches or `#1#` for named matches. Named matches will be passed as arguments to the event handler function.
4. Implement the handler function for the new event. Template code is provided, including a function `event_handler`. The function arguments should be updated to match the number of arguments matched in the event pattern. The first argument to the event handler is always the complete line which matched the pattern.

## Adding Condition Events

1. Select `Condition Events` and click `Add Event...`.
2. Enter a name for the new event.
3. Implement the `condition` and `action` functions for the new event. The condition function should return a boolean value, `true` or `false`.

## Editing Event Code

All event implementations are saved to individual lua files in `/lua/lem/events` or `/lua/lem/conditions`. Editing the code in something like Visual Studio Code is probably still going to be easier than editing within an ImGui window.

## TLO

LEM settings can be accessed via the `LEM` TLO:

| DataType     | Member    | Type         | Description                                                        | Example                             |
|--------------|-----------|--------------|--------------------------------------------------------------------|-------------------------------------|
| LEMType      | ToString  | string       | Outputs the current version of LEM which is installed              | /echo ${LEM}                        |
|              | Frequency | int          | Output the frequency which the main LEM loop runs events           | /echo ${LEM.Frequency}              |
|              | Broadcast | string       | Output the broadcast channel used to announce event enable/disable | /echo ${LEM.Broadcast}              |
|              | LogLevel  | string       | Output the current log level for events                            | /echo ${LEM.LogLevel}               |
|              | Event     | LEMEventType | Access the event with the specified name                           | /echo ${LEM.Event[event1]}          |
|              | React     | LEMReactType | Access the react with the specified name                           | /echo ${LEM.React[react1]}          |
| LEMEventType | ToString  | string       | Output the name and enabled status of the event                    | /echo ${LEM.Event[event1]}          |
|              | Enabled   | bool         | Output whether the event is currently enabled                      | /echo ${LEM.Event[event1].Enabled}  |
|              | Category  | string       | Output the category which the event belongs to                     | /echo ${LEM.Event[event1].Category} |
|              | Pattern   | string       | Output the pattern string of the event                             | /echo ${LEM.Event[event1].Pattern}  |
| LEMReactType | ToString  | string       | Output the name and enabled status of the event                    | /echo ${LEM.React[react1]}          |
|              | Enabled   | bool         | Output whether the event is currently enabled                      | /echo ${LEM.React[react1].Enabled}  |
|              | Category  | string       | Output the category which the named event belongs to               | /echo ${LEM.React[react1].Category} |