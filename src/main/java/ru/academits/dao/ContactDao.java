package ru.academits.dao;

import ru.academits.model.Contact;
import ru.academits.service.ContactValidation;

import java.util.ArrayList;
import java.util.List;

public class ContactDao {
    private final List<Contact> contactList = new ArrayList<>();
    private Contact lastContact = new Contact();
    private ContactValidation lastContactValidation = new ContactValidation();
    private int newId = 0;

    public ContactDao() {
        Contact contact = new Contact();
        contact.setId(getNewId());
        contact.setFirstName("Иван");
        contact.setLastName("Иванов");
        contact.setPhone("9123456789");
        contactList.add(contact);
    }

    private int getNewId() {
        newId++;

        return newId;
    }

    public List<Contact> getAllContacts() {
        return contactList;
    }

    public void add(Contact contact) {
        contact.setId(getNewId());
        contactList.add(contact);
    }

    public void saveLastContact(Contact contact) {
        this.lastContact = contact;
    }

    public Contact getLastContact() {
        return lastContact;
    }

    public void saveLastContactValidation(ContactValidation contactValidation) {
        this.lastContactValidation = contactValidation;
    }

    public void deleteContact(int id) {
        contactList.removeIf(contact -> contact.getId() == id);
    }

    public ContactValidation getLastContactValidation() {
        return lastContactValidation;
    }
}