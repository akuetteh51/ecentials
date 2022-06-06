import 'package:flutter/material.dart';

class ChatMessage {
  final String messageContent;
  final String messageType;
  const ChatMessage({required this.messageContent, required this.messageType});
}

List<ChatMessage> messages = [
  new ChatMessage(messageContent: "Hey There!", messageType: "receiver"),
  ChatMessage(messageContent: "How are you?", messageType: "receiver"),
  new ChatMessage(messageContent: "How was your day?", messageType: "receiver"),
  new ChatMessage(messageContent: "Hello!", messageType: "sender"),
  new ChatMessage(
      messageContent: "I am fine and how are you?", messageType: "sender"),
  new ChatMessage(
      messageContent: "I am fine and how are you?", messageType: "sender"),
  new ChatMessage(
      messageContent: "I am doing well, Can we meet tomorrow?",
      messageType: "receiver"),
  new ChatMessage(messageContent: "Yes Sure!", messageType: "sender"),
  new ChatMessage(messageContent: "At what time?", messageType: "sender"),
];
