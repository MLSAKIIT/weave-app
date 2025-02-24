import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weave_app/custom_widgets/card_box.dart';
import 'package:weave_app/custom_widgets/constants.dart';
import 'package:weave_app/custom_widgets/member_grid.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/backgrounds/star.png',
                fit: BoxFit.cover,
              ),
            ),
            SafeArea(
                child: SingleChildScrollView(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  _buildHeader(),
                  SizedBox(
                    height: 64,
                  ),
                  _buildLogo(),
                  SizedBox(
                    height: 128,
                  ),
                  ..._buildAlooParatha(),
                ],
              ),
            )),
          ],
        ));
  }
}

Widget _buildHeader() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0),
    child: Row(
      children: [
        SvgPicture.asset('assets/icons/weave_logo.svg', height: 60),
        SizedBox(
          width: 8.0,
        ),
        Image.asset(
          'assets/icons/Weave.png',
          height: 70,
          width: 100,
        ),
        Spacer(),
        Image.asset(
          'assets/icons/person_filled.png',
          height: 30,
        )
      ],
    ),
  );
}

Widget _buildLogo() {
  return Image.asset(
    'assets/icons/mlsa_logo.png',
    width: 400,
  );
}

List<Widget> _buildAlooParatha() {
  return [
    const Cardbox(
      title: "Who We Are",
      description:
          "Microsoft Learn Student Ambassadors - KIIT (MLSA KIIT) is a dynamic and vibrant community of tech enthusiasts, innovators, and student leaders from Kalinga Institute of Industrial Technology (KIIT). As part of Microsoft's global Student Ambassadors Program, we aim to empower students by fostering a culture of learning, collaboration, and innovation.",
      imageurl: 'assets/icons/Question.png',
    ),
    const SizedBox(
      height: 128,
    ),
    const Cardbox(
      title: "What We Do",
      description:
          "At MLSA KIIT, we strive to bridge the gap between students and industry-leading technologies. Our initiatives include: ->Workshops & Tech Talks – Hands-on sessions on Microsoft technologies like Azure, Power Platform, AI, and more.->Hackathons & Competitions – Organizing and participating in global coding challenges.->Projects & Open Source – Encouraging students to contribute to real-world projects and open-source initiatives.",
      imageurl: 'assets/icons/To do list.png',
    ),
    const SizedBox(
      height: 128,
    ),
    const Cardbox(
      title: "Our Mission",
      description:
          "Our mission is to empower students with technical skills, inspire innovation, and build a strong community of developers and problem-solvers. We believe in learning, sharing, and growing together while making a meaningful impact in the tech ecosystem.",
      imageurl: 'assets/icons/Launch.png',
      bottomspace: 56,
    ),
    const SizedBox(
      height: 192,
    ),
    const Card.filled(
      color: Color(0xff101426),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          'OUR DOMAINS',
          style: TextStyle(color: primaryColor, fontSize: 32),
        ),
      ),
    ),
    const SizedBox(
      height: 56,
    ),
    const Cardbox(
      title: "Technical",
      description:
          "Our tech-savvy team of innovators and problem solvers. With their expertise in cutting-edge tools and technologies, they create seamless digital experiences, thus making learning lively and fun",
      imageurl: 'assets/icons/Question.png',
      bottomspace: 56,
    ),
    const SizedBox(
      height: 128,
    ),
    const Cardbox(
      title: "Creative",
      description:
          "Our team of imaginative minds who breathe life into ideas with their boundless creativity. With their diverse skill sets, they transform visions into stunning works of art, leaving audiences awestruck",
      imageurl: 'assets/icons/Paint brush.png',
      bottomspace: 56,
    ),
    const SizedBox(
      height: 128,
    ),
    const Cardbox(
      title: "Operations",
      description:
          "Our operations team is the backbone of our society. With their exceptional organizational skills, they handle logistics, coordination, and resource management, enabling seamless execution of projects and initiatives.",
      imageurl: 'assets/icons/Model.png',
      bottomspace: 56,
    ),
    const SizedBox(
      height: 128,
    ),
    const Cardbox(
      title: "Marketing",
      description:
          "Our team of zealous minds who amplify the voice of MLSA, helping us link with the audience and corporate world. Their creative thinking, market insights, and innovative tactics drive our success.",
      imageurl: 'assets/icons/Connection.png',
      bottomspace: 56,
    ),
    const SizedBox(
      height: 128,
    ),
    const Cardbox(
      title: "Broadcasting",
      description:
          "A team of creative minds who bring our ideas to life. Through their mastery of video storytelling, exceptional editing skills, and a deep understanding of YouTube, they craft engaging content to captivate viewers",
      imageurl: 'assets/icons/Documentary.png',
      bottomspace: 56,
    ),
    const SizedBox(
      height: 128,
    ),
    const Cardbox(
      title: "Design",
      description:
          "A team of visionary artists breathing life into ideas through their exceptional skill set. With their keen eye for aesthetics and creative expertise, they transform concepts into stunning visual experiences.",
      imageurl: 'assets/icons/Vector.png',
      bottomspace: 56,
    ),
    const SizedBox(
      height: 128,
    ),
    const Card.filled(
      color: Color(0xff101426),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          'MLSA MEMBERS',
          style: TextStyle(color: primaryColor, fontSize: 32),
        ),
      ),
    ),
    const SizedBox(
      height: 48,
    ),
    const MemberGrid(
      title: 'Web Development',
      memberImages: [],
    ),
    const MemberGrid(
      title: 'App Development',
      memberImages: [],
    ),
    const MemberGrid(
      title: 'AI/ML',
      memberImages: [],
    ),
    const MemberGrid(
      title: 'Graphic Designing',
      memberImages: [],
    ),
    const MemberGrid(
      title: 'UI/UX',
      memberImages: [],
    ),
    const MemberGrid(
      title: 'Cloud',
      memberImages: [],
    ),
    const MemberGrid(
      title: 'XR',
      memberImages: [],
    ),
    const MemberGrid(
      title: 'Content',
      memberImages: [],
    ),
    const MemberGrid(
      title: 'Broadcasting',
      memberImages: [],
    ),
  ];
}
