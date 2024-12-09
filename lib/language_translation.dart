import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class LanguageTranslationPage extends StatefulWidget {
  const LanguageTranslationPage({super.key});

  @override
  _LanguageTranslationPageState createState() => _LanguageTranslationPageState();
}

class _LanguageTranslationPageState extends State<LanguageTranslationPage> {
  var languages = ["Hindi", "English", "Odisha", "Telegu", "Marathi","Bengali", "Tamil","Urdu"];
  var originLanguage = "From";
  var destinationLanguage = "To";
  var output = "";
  TextEditingController languageController = TextEditingController();

  void translate(String src, String dest, String input) async {
    // Validate input before making the API call
    if (src == "--" || dest == "--" || input.trim().isEmpty) {
      setState(() {
        output = "Please select valid languages and enter text.";
      });
      return;
    }

    try {
      GoogleTranslator translator = GoogleTranslator();
      var translation = await translator.translate(input, from: src, to: dest);
      setState(() {
        output = translation.text.toString();
      });
    } catch (e) {
      setState(() {
        output = "Translation failed. Please try again.";
      });
    }
  }

  String getLanguageCode(String language) {
    if (language == "English") {
      return "en";
    } else if (language == "Hindi") {
      return "hi";
    }
    else if (language == "Urdu")
    {
      return "ur";
    }
    else if (language == "Odisha")
    {
      return "or";
    }
    else if (language == "Telegu")
    {
      return "te";
    }
    else if (language == "Marathi")
    {
      return "mr";
    }
    else if (language == "Bengali")
    {
      return "bn";
    }
    else if (language == "Tamil")
    {
      return "ta";
    }
    else
    {
      return "--";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Language Translator"),
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xff10223d),
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownButton(
                    value: originLanguage == "From" ? null : originLanguage,
                    hint: const Text(
                      "From",
                      style: TextStyle(color: Colors.black),
                    ),
                    items: languages.map((String dropDownStringItem) {
                      return DropdownMenuItem(
                        child: Text(dropDownStringItem),
                        value: dropDownStringItem,
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        originLanguage = value!;
                      });
                    },
                  ),
                  const SizedBox(width: 40),
                  const Icon(Icons.arrow_right_alt_outlined,
                      color: Colors.black, size: 40),
                  const SizedBox(width: 40),
                  DropdownButton(
                    value: destinationLanguage == "To" ? null : destinationLanguage,
                    hint: const Text(
                      "To",
                      style: TextStyle(color: Colors.black),
                    ),
                    items: languages.map((String dropDownStringItem) {
                      return DropdownMenuItem(
                        child: Text(dropDownStringItem),
                        value: dropDownStringItem,
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        destinationLanguage = value!;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextFormField(
                  cursorColor: Colors.black,
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
                    labelText: "Please Enter Your Text...",
                    labelStyle: TextStyle(fontSize: 15, color: Colors.black),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 1,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1),
                    ),
                  ),
                  controller: languageController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child:ElevatedButton(
                  onPressed: () {
                    translate(
                      getLanguageCode(originLanguage),
                      getLanguageCode(destinationLanguage),
                      languageController.text,
                    );
                  },
                  child: const Text('Translate'),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                output,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );

  }
}
