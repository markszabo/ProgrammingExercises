% Project Euler Problem 59 -https://projecteuler.net/problem=59 
% Each character on a computer is assigned a unique code and the preferred standard is ASCII (American Standard Code for Information Interchange). For example, uppercase A = 65, asterisk (*) = 42, and lowercase k = 107.
% A modern encryption method is to take a text file, convert the bytes to ASCII, then XOR each byte with a given value, taken from a secret key. The advantage with the XOR function is that using the same encryption key on the cipher text, restores the plain text; for example, 65 XOR 42 = 107, then 107 XOR 42 = 65.
% For unbreakable encryption, the key is the same length as the plain text message, and the key is made up of random bytes. The user would keep the encrypted message and the encryption key in different locations, and without both "halves", it is impossible to decrypt the message.
% Unfortunately, this method is impractical for most users, so the modified method is to use a password as a key. If the password is shorter than the message, which is likely, the key is repeated cyclically throughout the message. The balance for this method is using a sufficiently long password key for security, but short enough to be memorable.
% Your task has been made easy, as the encryption key consists of three lower case characters. Using cipher.txt (right click and 'Save Link/Target As...'), a file containing the encrypted ASCII codes, and the knowledge that the plain text must contain common English words, decrypt the message and find the sum of the ASCII values in the original text.

clear;
cipherText = readInputFile('p059_cipher.txt');

%key: 3 lowercase characters, so ascii 97-122 (decimal)
%ciphertext: probably printable text, so ascii 32-126

keys=[];

%first check for possible keys, which decrypt the whole text to printable
%ascii
for keyI=1:3
    nrOfKeysFound = 1;
    for k=37:122 %key
        possibleKey = 1;
        for i=1:length(cipherText)
            if(mod(i,3)+1 == keyI)
                if(bitxor(cipherText(i),k) < 32 || bitxor(cipherText(i),k) > 126)
                    possibleKey = 0;
                    break;
                end
            end
        end
        if possibleKey == 1
            keys(keyI, nrOfKeysFound) = k;
            nrOfKeysFound = nrOfKeysFound + 1;
        end
    end
end

mostCommonLetters = [];

%% select the real key from the possible keys based on the fact,
% that the most common character is space
for keyI=1:3  
    [~,nrOfKeys] = size(keys); 
    for k=1:nrOfKeys
        if keys(keyI,k) == 0
            continue;
        end
        charFrequency = zeros(128,1);
        for ii=1:length(cipherText)
            if mod(ii,3)+1 == keyI
                charFrequency(bitxor(cipherText(ii),keys(keyI,k))) = charFrequency(bitxor(cipherText(ii),keys(keyI,k))) + 1;
            end
        end
        j = 1;
        while charFrequency(j) ~= max(charFrequency)
            j = j+1;
        end
        mostCommonLetters(keyI,k) = j;
    end
end

%generate the key 
key = [];

for keyI=1:3
    j = 1;
    while mostCommonLetters(keyI,j) ~= 32 %ascii 32 is space
        j = j+1;
    end
    key(keyI) = keys(keyI,j);
end

%% decrypt the ciphertext
 plainText = [];
 for keyI=1:length(cipherText)
     plainText(keyI) = bitxor(cipherText(keyI),key(mod(keyI,3)+1));
 end

 %% print the decrypted plaintext
char(plainText)
% print the sum for the Project Euler challenge
sum(plainText)