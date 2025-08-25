import 'package:flutter/material.dart';

class Offer extends StatefulWidget {
  final String title;
  final String subtitle;
  final String trailing;
  const Offer({required this.title,required this.subtitle,required this.trailing,super.key});

  @override
  State<Offer> createState() => _OfferState();
}

class _OfferState extends State<Offer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white, // white background
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.4),
            spreadRadius: 2,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
      
        title: Text(widget.title),
        subtitle: Text(widget.subtitle),
      
        trailing: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
      
            color: Colors.purple,
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(colors: [
              Colors.purple,
              Colors.pink,
            ])
          ),
          child: Text(widget.trailing,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        ),
      
      ),
    );
  }
}
