# I18n::Object

`I18n::Object` provides you can use wrapper classes for easy handling/testing of I18n by just only configuration.

## The Value of I18n::Object

This gem resolves these problems:

- It's not a easy to deal with deep nested YAML files from both product and test codes.
- We need wrapper class for easy handling/testing of `I18n#translate` to **avoid TYPOs and translation missings**!!

This `i18n-object` provides you can get to use wrapper classes just only assign namespaces in the initializer file:

```ruby
# config/initializers/i18n_object.rb
I18n::Object.namespaces = %w[
  notification
  slack_notificaiton/admin
  slack_notificaiton/consumer
]
```

And you have to define YAML files on `config/locales` like this:

```yaml
en:
  notification:
    say: Hi, %{name}!
  slack_notification:
    admin:
      say: Hi, admin!
    consumer:
      say: Hi, consumer!
```

Then you can use wrapper classes:

```ruby
Notificaiton.say(name: 'alice') # Hi, alice!
SlackNotification::Admin.say # Hi, admin!
SlackNotification::Consumer.say # Hi, consumer!
Notification.hello # No Method Error
```

Finally you can get relief from **pain of TYPOs and translation missings**.

## Installation

1. Add `i18n-object` to your `Gemfile`:

```ruby
gem 'i18n-object'
```

2. Execute this command to generate an initializer:

```
$ bin/rails generate i18n:object:install
```

3. Assign namespaces and prepare locale files:

```ruby
# Assign I18n Object names:
#
# e.g.)
#
# I18n::Object.namespaces = %w[
#   notification
#   slack_notificaiton/admin
#   slack_notificaiton/consumer
# ]
#
# en:
#   notification:
#     say: Hi, %{name}!
#   slack_notification:
#     admin:
#       say: Hi, admin!
#     consumer:
#       say: Hi, consumer!
#
# Notificaiton.say(name: 'alice') # Hi, alice!
# Notification.hello # NoMethodError
# SlackNotification::Admin.say # Hi, admin!
# SlackNotification::Consumer.say # Hi, consumer!

I18n::Object.namespaces = %w[
]
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
