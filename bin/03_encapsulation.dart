/// ─── Topic 04: Encapsulation & Private Variables ───────────────────────
///
/// Encapsulation means keeping an object's data safe from outside tampering.
///
/// In this script, we'll see:
/// 1. Private variables in Dart (prefixed with an underscore: `_balance`).
/// 2. Getters to read private variables without editing them.
/// 3. Secure methods with business logic constraints (validation) to update state safely.

class BankAccount {
  // Public variable — anyone can view or change this directly
  String owner;

  // Private variable — the leading underscore "_" hides it.
  // In Dart, "private" means private to the file/library.
  double _balance;

  // Constructor
  BankAccount(this.owner, this._balance);

  // Getter: Exposes the value of _balance as read-only.
  // Code in other files can read "account.balance" but cannot write "account.balance = 500;"
  double get balance => _balance;

  // A getter to check if the user is a VIP (computed property)
  bool get isVIP => _balance >= 10000.0;

  // Public method to deposit money safely (with checking logic)
  void deposit(double amount) {
    if (amount <= 0) {
      print('❌ Deposit failed: Amount must be greater than \$0.');
      return;
    }
    _balance += amount;
    print('💰 [DEPOSIT] \$${amount.toStringAsFixed(2)} added to $owner\'s account.');
  }

  // Public method to withdraw money safely (with validation checks)
  void withdraw(double amount) {
    if (amount <= 0) {
      print('❌ Withdrawal failed: Amount must be greater than \$0.');
    } else if (amount > _balance) {
      print('❌ Withdrawal failed: Insufficient funds! Available: \$${_balance.toStringAsFixed(2)}');
    } else {
      _balance -= amount;
      print('💸 [WITHDRAWAL] \$${amount.toStringAsFixed(2)} withdrawn. Remaining: \$${_balance.toStringAsFixed(2)}');
    }
  }
}

void main() {
  print('====================================================');
  print('🎓 LESSON 04: ENCAPSULATION & PRIVATE VARIABLES');
  print('====================================================\n');

  print('👉 Step 1: Initializing a BankAccount with \$1,000.00...');
  BankAccount account = BankAccount('Shrijal', 1000.0);
  print('Account Owner: ${account.owner}');
  print('Initial Balance: \$${account.balance.toStringAsFixed(2)}');
  print('Is VIP User? ${account.isVIP ? "Yes! 🎉" : "No 🔍"}');
  print('----------------------------------------------------');

  print('👉 Step 2: Depositing and Withdrawing safely using methods...');
  account.deposit(500.0);   // Should succeed
  account.withdraw(200.0);  // Should succeed
  print('Current balance read via getter: \$${account.balance.toStringAsFixed(2)}');
  print('----------------------------------------------------');

  print('👉 Step 3: Triggering logical validations (boundary testing)...');
  account.deposit(-50.0);   // Negative deposit (should fail)
  account.withdraw(2500.0); // Overdraft withdrawal (should fail)
  print('Final safe balance: \$${account.balance.toStringAsFixed(2)}');
  print('----------------------------------------------------');

  print('👉 Step 4: Trying to bypass rules (Encapsulation check)...');
  // Attempting to directly write to the private field will not be possible
  // if this class was imported from another file.
  // In Dart, private members are scoped to the file, not the class.
  // That's why we use custom getters and setters to maintain security!
  
  print('💡 Takeaway: Encapsulation protects objects like an ATM.');
  print('You can\'t reach inside to grab the cash, but you can request withdrawals safely through the keypad (methods).');
  print('====================================================');
}
