import 'package:english_mastery/application/grammar_bloc/grammar_bloc.dart';
import 'package:flutter/material.dart';

class ArticlesQuantifiersWidget extends StatefulWidget {
  const ArticlesQuantifiersWidget({
    super.key,
    required this.state,
  });
  final GrammarArticlesQuantifiersState state;

  @override
  _ArticlesQuantifiersWidgetState createState() =>
      _ArticlesQuantifiersWidgetState();
}

class _ArticlesQuantifiersWidgetState extends State<ArticlesQuantifiersWidget> {
  // This list keeps track of the visibility status of each answer
  late List<bool> _showAnswers;

  @override
  void initState() {
    super.initState();
    _showAnswers = List.filled(
        widget.state.articlesQuantifiersModel.first.questions.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Text(
              widget.state.articlesQuantifiersModel.first.task ??
                  "Articles Quantifiers task",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            // const SizedBox(height: 8),
            // Text(
            //   widget.state.collocationModel.first.task ??
            //       "Sentence Completion Task",
            //   style: const TextStyle(
            //     fontSize: 18,
            //     color: Colors.black87,
            //   ),
            // ),
            const SizedBox(height: 8),
            Text(
              widget.state.articlesQuantifiersModel.first.description ??
                  "description",
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 16),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount:
                  widget.state.articlesQuantifiersModel.first.questions.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Question ${index + 1}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.blueAccent,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          widget.state.articlesQuantifiersModel.first
                                  .questions[index] ??
                              "Question text",
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 8),
                        // Toggle button to reveal or hide the answer
                        TextButton(
                          onPressed: () {
                            setState(() {
                              _showAnswers[index] = !_showAnswers[index];
                            });
                          },
                          child: Text(
                            _showAnswers[index] ? "Hide Answer" : "Show Answer",
                            style: const TextStyle(color: Colors.blueAccent),
                          ),
                        ),
                        // Conditionally show the answer based on _showAnswers[index]
                        if (_showAnswers[index])
                          Text(
                            "${widget.state.articlesQuantifiersModel.first.answers[index] ?? "Answer text"}",
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.green,
                            ),
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
