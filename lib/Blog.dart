import 'package:flutter/material.dart';
import 'BottomNavBar.dart';
import 'ToolsScreen.dart'; // Import your ToolsPage file
import 'Profile.dart'; // Import your ProfilePage file
import 'Home_Page.dart';

class BlogPage extends StatefulWidget {
  @override
  _BlogPageState createState() => _BlogPageState();
}
class _BlogPageState extends State<BlogPage> {
  int _currentIndex = 1;

  List<BlogPost> blogPosts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RichText(
          text: TextSpan(
            children: [
              WidgetSpan(
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Icon(
                    Icons.library_books,
                    size: 24, // Set the icon size
                  ),
                ),
              ),
              TextSpan(
                text: 'Blog',
                style: TextStyle(
                  fontFamily: 'Roboto', // Replace with the desired font family
                  fontSize: 25, // Set the font size
                  color: Colors.black, // Set the font color to black
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.deepPurple, // Set the background color to deep purple
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Handle search action
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: blogPosts.length,
              itemBuilder: (context, index) {
                return BlogPostWidget(blogPost: blogPosts[index], onAddComment: _addComment);
              },
            ),
          ),
          ShareExperienceButton(
            onPostExperience: (BlogPost newPost) {
              setState(() {
                blogPosts.add(newPost);
              });
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTabTapped: (index) {
          // Handle navigation based on the tapped item
          switch (index) {
            case 0:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomePage(isUser: true)),
              );
              break;
            case 1:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => BlogPage()),
              );
              break;
            case 2:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ToolsScreen()),
              );
              break;
            case 3:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
              break;
          }
        },
      ),

    );
  }

  void _addComment(BlogPost blogPost, String newComment) {
    setState(() {
      blogPost.comments.add(Comment(author: 'User', text: newComment));
    });
  }
}

class BlogPostWidget extends StatelessWidget {
  final BlogPost blogPost;
  final Function(BlogPost, String) onAddComment;

  BlogPostWidget({required this.blogPost, required this.onAddComment});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16),
      elevation: 4, // Add elevation for a card shadow
      color: Colors.deepPurple[100], // Set card background color to a shade of deep purple
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(blogPost.title),
            subtitle: Text(
              '${blogPost.author} • ${_formatDateTime(blogPost.dateTime)}',
            ),
            leading: Icon(Icons.subject, color: Colors.deepPurple), // Add a subject icon
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(blogPost.content),
          ),
          CommentSection(comments: blogPost.comments),
          ElevatedButton.icon(
            onPressed: () {
              // Handle adding a new comment
              _showCommentDialog(context);
            },
            icon: Icon(Icons.comment), // Add a comment icon
            label: Text('Add Comment'),
            style: ElevatedButton.styleFrom(
              primary: Colors.black, // Set button color to black
            ),
          ),
        ],
      ),
    );
  }

  String _formatDateTime(DateTime dateTime) {
    return '${_formatTwoDigitNumber(dateTime.hour)}:${_formatTwoDigitNumber(dateTime.minute)} - ${_formatTwoDigitNumber(dateTime.day)}/${_formatTwoDigitNumber(dateTime.month)}/${dateTime.year}';
  }

  String _formatTwoDigitNumber(int number) {
    return number.toString().padLeft(2, '0');
  }

  Future<void> _showCommentDialog(BuildContext context) async {
    String newComment = '';
    await showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Comment'),
          content: TextField(
            decoration: InputDecoration(
              hintText: 'Write your comment...',
            ),
            onChanged: (value) {
              // Update the comment text
              newComment = value;
            },
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Add the comment to the list
                onAddComment(blogPost, newComment);
                Navigator.of(context).pop();
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }
}

class CommentSection extends StatelessWidget {
  final List<Comment> comments;

  CommentSection({required this.comments});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Comments', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.deepPurple)), // Set comment section text color
        for (var comment in comments) CommentWidget(comment: comment),
      ],
    );
  }
}

class CommentWidget extends StatelessWidget {
  final Comment comment;

  CommentWidget({required this.comment});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(comment.author),
      subtitle: Text(comment.text),
    );
  }
}

class ShareExperienceButton extends StatelessWidget {
  final Function(BlogPost) onPostExperience;

  ShareExperienceButton({required this.onPostExperience});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Navigate to the page where the user can share their experience
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ShareExperiencePage(
              onPostExperience: onPostExperience,
            ),
          ),
        );
      },
      child: Text('Share Your Experience', style: TextStyle(color: Colors.black)), // Set text color to white
      style: ElevatedButton.styleFrom(
        primary: Colors.deepPurpleAccent, // Set button color to black
      ),
    );
  }
}

class ShareExperiencePage extends StatefulWidget {
  final Function(BlogPost) onPostExperience;

  ShareExperiencePage({required this.onPostExperience});

  @override
  _ShareExperiencePageState createState() => _ShareExperiencePageState();
}

class _ShareExperiencePageState extends State<ShareExperiencePage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController postController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Share Your Experience', style: TextStyle(color: Colors.white)), // Set text color to deep orange
        backgroundColor: Colors.deepPurpleAccent, // Set the background color to a shade of purple
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                hintText: 'Write your post title...',
              ),
            ),
            TextField(
              controller: postController,
              decoration: InputDecoration(
                hintText: 'Write your post...',
              ),
              maxLines: 5,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Create a new blog post
                BlogPost newPost = BlogPost(
                  title: titleController.text,
                  author: 'User', // You can get the user's name from authentication
                  content: postController.text,
                  dateTime: DateTime.now(), // Current date and time
                  comments: [], // Initially, the post has no comments
                );

                // Trigger the callback to add the new post to the blog page
                widget.onPostExperience(newPost);

                // Navigate back to the blog page
                Navigator.pop(context);
              },
              child: Text('Post', style: TextStyle(color: Colors.white)), // Set text color to white
              style: ElevatedButton.styleFrom(
                primary: Colors.deepPurpleAccent, // Set button color to deep orange
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BlogPost {
  final String title;
  final String author;
  final String content;
  final DateTime dateTime;
  final List<Comment> comments;

  BlogPost({
    required this.title,
    required this.author,
    required this.content,
    required this.dateTime,
    required this.comments,
  });
}

class Comment {
  final String author;
  final String text;

  Comment({required this.author, required this.text});
}
