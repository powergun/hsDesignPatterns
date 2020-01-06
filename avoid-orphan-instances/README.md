# Avoid Orphan Instances

source: First Principles P/620

> You defined the type but not the typeclass? Put the instance in the same module as the type so that the type cannot be imported without its instances.
> You defined the typeclass but not the type? Put the instance in the same module as the typeclass definition so that the typeclass cannot be imported without its instances.
> Neither the type nor the typeclass are yours? Define your own newtype wrapping the original type and now you’ve got a type that “belongs” to you for which you can rightly define typeclass instances. There are means of making this less annoying which we’ll discuss later.
