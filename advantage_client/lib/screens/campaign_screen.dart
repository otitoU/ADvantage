import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/nav_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CampaignScreen extends StatefulWidget {
  @override
  _CampaignScreenState createState() => _CampaignScreenState();
}

class _CampaignScreenState extends State<CampaignScreen> {
  int _currentStep = 0;
  String _selectedAdType = "";
  String _selectedPlatform = "General";
  String _selectedAspectRatio = "9:16";
  String _selectedDuration = "15s";
  String _selectedScript = "";
  String _selectedAdvertiser = "";

  void _nextStep() {
    setState(() {
      if (_currentStep < 4) _currentStep++;
    });
  }

  void _previousStep() {
    setState(() {
      if (_currentStep > 0) _currentStep--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return NavBar(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildStepContent(),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _currentStep > 0
                            ? ElevatedButton(
                                onPressed: _previousStep,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.grey,
                                ),
                                child: Text("Back",
                                    style: GoogleFonts.poppins(
                                        fontSize: 14, color: Colors.white)),
                              )
                            : SizedBox(),
                        ElevatedButton(
                          onPressed: _nextStep,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue.shade900,
                          ),
                          child: Text("Next",
                              style: GoogleFonts.poppins(
                                  fontSize: 14, color: Colors.white)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStepContent() {
    switch (_currentStep) {
      case 0:
        return _buildAdSelection(context);
      case 1:
        return _buildProductLinkInput();
      case 2:
        return _buildVideoSettings();
      case 3:
        return _buildScriptSelection();
      case 4:
        return _buildAdvertiserSelection();
      default:
        return _buildAdSelection(context);
    }
  }

  Widget _buildAdSelection(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Create New AI-Powered Ad",
          style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 150),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildAdCard("Text Ads", "Best for Google Ads, Search Ads"),
            SizedBox(width: 50),
            _buildAdCard("Image Ads", "Best for Facebook, Instagram, LinkedIn"),
            SizedBox(width: 50),
            _buildAdCard("Video Ads", "Best for TikTok, YouTube, Reels"),
          ],
        ),
        SizedBox(height: 100),
      ],
    );
  }

  Widget _buildAdCard(String title, String subtitle) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedAdType = title;
        });
      },
      child: Container(
        width: 250,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: _selectedAdType == title
                ? Colors.blue.shade900
                : Colors.transparent,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: GoogleFonts.poppins(
                  fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(fontSize: 14, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductLinkInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 50),
        Text(
          "Share your product link to generate a video",
          style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 80),
        Text(
          "ADvantage supports:",
          style: GoogleFonts.poppins(fontSize: 16, color: Colors.black54),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 15),
        _buildSupportedBrands(),
        SizedBox(height: 20),
        _buildProductLinkField(),
      ],
    );
  }

  Widget _buildSupportedBrands() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _brandIcon('assets/images/dell.png'),
        _brandIcon('assets/images/hdp.png'),
        _brandIcon('assets/images/ebay_PNG18.png'),
        _brandIcon('assets/images/amazon.png'),
        _brandIcon('assets/images/cisco.png'),
        _brandIcon('assets/images/bestbuy.png'),
      ],
    );
  }

  Widget _brandIcon(String assetPath) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Image.asset(
        assetPath,
        width: 60,
        height: 60,
      ),
    );
  }

  Widget _buildProductLinkField() {
    return Container(
      width: 500,
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: "e.g. ebay product link",
          hintStyle: GoogleFonts.poppins(fontSize: 14, color: Colors.black54),
          contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.blue.shade900),
          ),
        ),
      ),
    );
  }

  Widget _buildVideoSettings() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Video Settings",
            style:
                GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold)),
        SizedBox(height: 50),
        _buildIconSelectableOptions(
            "Platform",
            {
              "General": Icons.public,
              "Facebook": FontAwesomeIcons.facebook,
              "Instagram": FontAwesomeIcons.instagram,
              "YouTube": FontAwesomeIcons.youtube,
              "TikTok": FontAwesomeIcons.tiktok,
              "LinkedIn": FontAwesomeIcons.linkedin,
              "Snapchat": FontAwesomeIcons.snapchat,
            },
            _selectedPlatform,
            (value) => setState(() => _selectedPlatform = value)),
        SizedBox(height: 50),
        _buildSelectableOptions(
            "Aspect Ratio",
            ["9:16", "16:9", "1:1"],
            _selectedAspectRatio,
            (value) => setState(() => _selectedAspectRatio = value)),
        SizedBox(height: 50),
        _buildSelectableOptions(
            "Duration",
            ["5s", "10s", "15s", "30s", "60s"],
            _selectedDuration,
            (value) => setState(() => _selectedDuration = value)),
      ],
    );
  }

  Widget _buildIconSelectableOptions(
      String title,
      Map<String, IconData> options,
      String selected,
      Function(String) onSelect) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style:
                GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w500)),
        SizedBox(height: 10),
        Wrap(
          spacing: 10,
          children: options.entries.map((entry) {
            return GestureDetector(
              onTap: () => onSelect(entry.key),
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: const Color.fromARGB(255, 80, 184, 87), width: 2),
                  borderRadius: BorderRadius.circular(12),
                  color: selected == entry.key
                      ? const Color.fromARGB(255, 50, 93, 158)
                      : Colors.white,
                ),
                child: Icon(entry.value,
                    color: selected == entry.key
                        ? Colors.white
                        : const Color.fromARGB(255, 50, 93, 158),
                    size: 28),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildSelectableOptions(String title, List<String> options,
      String selected, Function(String) onSelect) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style:
                GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w500)),
        SizedBox(height: 10),
        Wrap(
          spacing: 10,
          children: options.map((option) {
            return GestureDetector(
              onTap: () => onSelect(option),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: const Color.fromARGB(255, 80, 184, 87), width: 2),
                  borderRadius: BorderRadius.circular(12),
                  color:
                      selected == option ? Colors.blue.shade900 : Colors.white,
                ),
                child: Text(option,
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: selected == option
                            ? Colors.white
                            : Colors.blue.shade900)),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildScriptSelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Video Settings",
            style:
                GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Text("Pick a script and tone",
            style:
                GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500)),
        SizedBox(height: 20),
        _buildScriptOption(
            "Product Lifecycle",
            "\"Your skin faces pollution, sun exposure, and stress every day but Neutrogena has your back...\"",
            "GenZ tone"),
        SizedBox(height: 10),
        _buildScriptOption(
            "Brand Story",
            "\"At Neutrogena, we believe skincare should be science-backed...\"",
            "Inspiring tone"),
        SizedBox(height: 10),
        _buildScriptOption(
            "Product Lifecycle",
            "\"Breakouts? Dull skin? It’s time for a Neutrogena glow-up!...\"",
            "Motivational tone"),
      ],
    );
  }

  Widget _buildScriptOption(String title, String description, String tone) {
    return GestureDetector(
      onTap: () => setState(() => _selectedScript = title),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: _selectedScript == title
              ? Colors.blue.shade50
              : Colors.grey.shade200,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title,
                    style: GoogleFonts.poppins(
                        fontSize: 18, fontWeight: FontWeight.bold)),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(tone,
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.white)),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(description,
                style:
                    GoogleFonts.poppins(fontSize: 14, color: Colors.black87)),
          ],
        ),
      ),
    );
  }

  Widget _buildAdvertiserSelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Video Settings",
            style:
                GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Text("Select an Advertiser Who Matches Your Brand's Voice",
            style:
                GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500)),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildAdvertiserCard(
                "Breanna", "Business Expert", "assets/images/woman.png"),
            _buildAdvertiserCard(
                "Aria", "Lifestyle Influencer", "assets/images/woman6.png"),
            _buildAdvertiserCard(
                "Destiny", "Lifestyle Influencer", "assets/images/woman2.png"),
            _buildAdvertiserCard(
                "Mario", "Tech Specialist", "assets/images/man.png"),
          ],
        ),
      ],
    );
  }

  Widget _buildAdvertiserCard(String name, String role, String imagePath) {
    return GestureDetector(
      onTap: () => setState(() => _selectedAdvertiser = name),
      child: Column(
        children: [
          Container(
            width: 120,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: _selectedAdvertiser == name
                    ? Colors.blue.shade900
                    : Colors.transparent,
                width: 3,
              ),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(name,
              style: GoogleFonts.poppins(
                  fontSize: 16, fontWeight: FontWeight.bold)),
          Text(role,
              style: GoogleFonts.poppins(fontSize: 14, color: Colors.black54)),
        ],
      ),
    );
  }
}
