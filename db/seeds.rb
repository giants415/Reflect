# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#

User.destroy_all
Post.destroy_all

user1 = User.create({username: "Andrew", email: "andrew@gmail.com", password: "password"})



post1 = Post.create({user_id: 1, title: "My First Post", content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras blandit sem et augue sagittis euismod. Nulla facilisi. In aliquet magna nec arcu hendrerit hendrerit. Ut aliquam quam vel tortor vehicula imperdiet. Quisque at ipsum erat. Maecenas justo augue, sodales vel massa ac, pharetra molestie augue. Curabitur euismod in orci ut aliquam. Fusce pulvinar quam justo, scelerisque tempus ex finibus vitae. Aliquam sit amet nulla massa. Cras nunc urna, sodales eget purus in, congue auctor purus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Suspendisse dictum et ex non auctor.

Maecenas tincidunt, elit non consectetur maximus, nunc ligula suscipit velit, vel accumsan ipsum ligula quis dolor. Sed et ultricies sapien. Praesent fermentum nisi vel turpis pulvinar porta. Quisque sit amet mi vel dui hendrerit viverra. Donec rhoncus erat nec tortor venenatis, facilisis hendrerit massa viverra. Phasellus eget purus mattis, molestie sapien eget, euismod est. Etiam ut laoreet lorem. In hac habitasse platea dictumst. Nunc rhoncus non purus eleifend vulputate. Cras et arcu vel libero tristique elementum vel sit amet eros. Cras scelerisque dui id commodo faucibus. Etiam ac est et diam imperdiet ornare ac at dui. Cras venenatis, arcu non sagittis lobortis, ligula tellus tincidunt erat, in porta tellus sapien in nibh. Duis eleifend rutrum nunc, vel molestie ligula molestie nec. Duis vitae feugiat neque.

Cras posuere ante nec augue interdum lacinia. Aliquam urna felis, viverra in diam a, aliquam tincidunt tortor. Curabitur maximus tortor in posuere dapibus. Phasellus ligula diam, posuere at luctus vestibulum, feugiat et metus. Vivamus vestibulum ipsum et fringilla aliquet. Praesent fermentum accumsan arcu id ultrices. Sed id dui eget urna sodales faucibus. Etiam accumsan convallis elementum. Mauris pharetra, sem in gravida iaculis, nisl enim consectetur sem, in suscipit ex lacus sed nulla. Proin elit metus, posuere nec metus vel, imperdiet tempus nunc. Duis nec pretium nulla. Praesent et posuere elit."})


p "Seeds have been run"
