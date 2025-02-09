import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        backgroundColor: const Color(0XFF017B6B),
        title: Text(
          'Payements',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text('Payment methods',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Color(0XFF02B099),
                )),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                  leading: ImageIcon(
                    AssetImage('assets/privacy_lock.png'),
                    color: Color(0XFF02B099),
                    size: 30,
                  ),
                  subtitle: RichText(
                      text: TextSpan(
                          style: GoogleFonts.poppins(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                          children: [
                        TextSpan(
                            text:
                                'To protect your security, WhatsApp does not store your UPI PIN or full bank account number. '),
                        TextSpan(
                            text: 'Learn more',
                            style: TextStyle(color: Color(0XFF02B099)))
                      ]))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
            child: ListTile(
              onTap: () {},
              leading: Icon(Icons.payment),
              title: Text('Add payment method',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  )),
            ),
          ),
          Divider(
            color: Colors.grey.withOpacity(0.5),
            thickness: 6,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
            child: ListTile(
              onTap: () {},
              leading: Icon(Icons.help),
              title: Text('Help',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  )),
            ),
          ),
          Expanded(
              child: Container(
            width: double.infinity,
            color: const Color.fromARGB(39, 158, 158, 158),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('POWERED BY',
                      style: GoogleFonts.poppins(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      )),
                ),
                SizedBox(
                  height: 40,
                  width: 80,
                  child: Image.network(
                      'https://s3-alpha-sig.figma.com/img/b1e8/cb87/491537b5e1dc11d1e9acb4a91fe4e337?Expires=1739750400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=abZrDaa83b8uH6jaemnVv02ZOs03NWpSmh8azPzHEHppA-V~9rN~Kchq3iRxxqTRA~yCDmoxsXwHosYbI8mWE3zD5J3PbeYDHvjVU09mg7MJ8Jv~Sa3GlX4iieIUBgYsom4vxE6yY6d3xUVbKtT2FJilFn2MLYvHbtRVcptYh8ilLC11lwS~qm3McGvkbLLjSJsWkZgHtxWI2nuPj99bbjRBht44yrsRJ1OTW3Ldu7LRVIgeBi8J0w6WW8OlIi2vZ85PJBVtcTwJN5VJ1LcJe77ffCFjBThN8yJ5xo2XQjMDtlOfJbQ-2R9F326KXZcVTJ3Z-3WPFCBwYaYZq8BnpA__'),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
