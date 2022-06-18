import 'package:flutter/material.dart';

class ChatMessage {
  final String messageContent;
  final String messageType;
  const ChatMessage({required this.messageContent, required this.messageType});
}

List<ChatMessage> messages = [
  ChatMessage(messageContent: "Hey There!", messageType: "receiver"),
  ChatMessage(messageContent: "How are you?", messageType: "receiver"),
  ChatMessage(messageContent: "How was your day?", messageType: "receiver"),
  ChatMessage(messageContent: "Hello!", messageType: "sender"),
  ChatMessage(
      messageContent: "I am fine and how are you?", messageType: "sender"),
  ChatMessage(
      messageContent: "I am fine and how are you?", messageType: "sender"),
  ChatMessage(
      messageContent: "I am doing well, Can we meet tomorrow?",
      messageType: "receiver"),
  ChatMessage(messageContent: "Yes Sure!", messageType: "sender"),
  ChatMessage(messageContent: "At what time?", messageType: "sender"),
];
