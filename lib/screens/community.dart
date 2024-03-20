import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Doctor Community',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DoctorCommunityPage(),
    );
  }
}

class DoctorCommunityPage extends StatefulWidget {
  @override
  _DoctorCommunityPageState createState() => _DoctorCommunityPageState();
}

class _DoctorCommunityPageState extends State<DoctorCommunityPage> {
  List<Article> articles = [];
  List<PatientQuery> queries = [];

  @override
  void initState() {
    super.initState();

    // Sample articles
    articles = [
      Article(
        title: 'Understanding Diabetes',
        content: 'Diabetes is a chronic condition that affects ...',
      ),
      Article(
        title: 'Importance of Regular Exercise',
        content: 'Regular exercise is essential for maintaining ...',
      ),
      Article(
        title: 'Tips for a Healthy Heart',
        content: 'Taking care of your heart is crucial for overall health ...',
      ),
      // Add more articles as needed
    ];

    // Sample patient queries
    queries = [
      PatientQuery(
        author: 'Patient 1',
        content:
            'I have been experiencing chest pain lately. What could be the cause?',
        doctorReply:
            'It is advisable to consult a doctor immediately for proper diagnosis and treatment.',
      ),
      PatientQuery(
        author: 'Patient 2',
        content: 'What are the symptoms of food poisoning?',
        doctorReply:
            'Common symptoms of food poisoning include nausea, vomiting, diarrhea, and stomach cramps. Seek medical attention if symptoms persist.',
      ),
      PatientQuery(
        author: 'Patient 3',
        content: 'How can I lower my cholesterol levels?',
        doctorReply:
            'To lower cholesterol levels, maintain a healthy diet, exercise regularly, avoid saturated fats, and consider medication if necessary.',
      ),
      // Add more patient queries as needed
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctor Community'),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              // Navigate to user profile page
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Articles',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: articles.length,
            itemBuilder: (BuildContext context, int index) {
              return ArticleWidget(article: articles[index]);
            },
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Patient Queries',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: queries.length,
            itemBuilder: (BuildContext context, int index) {
              return QueryWidget(query: queries[index]);
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreatePostPage()),
          ).then((newPost) {
            if (newPost != null) {
              if (newPost is Article) {
                setState(() {
                  articles.add(newPost);
                });
              } else if (newPost is PatientQuery) {
                setState(() {
                  queries.add(newPost);
                });
              }
            }
          });
        },
        tooltip: 'Create Post',
        child: Icon(Icons.add),
      ),
    );
  }
}

class Article {
  final String title;
  final String content;

  Article({required this.title, required this.content});
}

class PatientQuery {
  final String author;
  final String content;
  final String doctorReply;

  PatientQuery(
      {required this.author, required this.content, required this.doctorReply});
}

class ArticleWidget extends StatelessWidget {
  final Article article;

  const ArticleWidget({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              article.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              article.content,
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}

class QueryWidget extends StatelessWidget {
  final PatientQuery query;

  const QueryWidget({Key? key, required this.query}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Author: ${query.author}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              query.content,
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Doctor\'s Reply:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              query.doctorReply,
              style: TextStyle(fontSize: 16.0, color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}

class CreatePostPage extends StatefulWidget {
  @override
  _CreatePostPageState createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _contentController = TextEditingController();

  bool _isArticle = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Post'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButtonFormField<bool>(
              value: _isArticle,
              items: [
                DropdownMenuItem<bool>(
                  value: true,
                  child: Text('Article'),
                ),
                DropdownMenuItem<bool>(
                  value: false,
                  child: Text('Patient Query'),
                ),
              ],
              onChanged: (bool? value) {
                setState(() {
                  _isArticle = value ?? true;
                });
              },
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                hintText: 'Title',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _contentController,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Content',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                if (_titleController.text.isNotEmpty &&
                    _contentController.text.isNotEmpty) {
                  Navigator.pop(
                    context,
                    _isArticle
                        ? Article(
                            title: _titleController.text,
                            content: _contentController.text,
                          )
                        : PatientQuery(
                            author: 'Patient',
                            content: _contentController.text,
                            doctorReply: 'Pending',
                          ),
                  );
                }
              },
              child: Text('Post'),
              style: ElevatedButton.styleFrom(
                textStyle: TextStyle(fontSize: 16.0),
                padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 12.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }
}
