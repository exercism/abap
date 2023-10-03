# Clone the ABAP Track

## Prerequisites

1. ABAP system release 7.4 or higher
2. abapGit v1.115.0 or higher
3. Authorizations to implement ABAP packages, programs, and classes

## Installing abapGit

The ABAP track with all exercises is implemented as an abapGit repository. To clone the track to your own system, you first have to install abapGit.

1. Go to [https://github.com/abapGit/abapGit](https://github.com/abapGit/abapGit)
2. Download the `zabapgit.abap` file 
3. Create program `zabapgit_standalone` in your own system
4. Upload the source from `zabapgit.abap` to program `zabapgit_standalone`
5. Activate the program

## Installing Exercism ABAP Track

### Online Repository

Use this method if your system is connected to the Internet and has access to GitHub.com (recommended approach).

1. Run abapGit

![abapGit Online Repo](https://github.com/exercism/abap/blob/main/docs/clone_01.png?raw=true)

2. On the "Repository Overview", select "New Online"
3. Enter the following values
- URL: `https://github.com/exercism/abap`
- Package: `$exer`
- Display Name: `Exercism - ABAP Track`

![abapGit Online Repo](https://github.com/exercism/abap/blob/main/docs/clone_02.png?raw=true)

4. Select "Create Online Repository". You should see a list of objects with status "A":

![abapGit Online Repo](https://github.com/exercism/abap/blob/main/docs/clone_03.png?raw=true)

5. Select "Pull" to clone all objects to your system. Once completed you should see all objects with a blank status

![abapGit Online Repo](https://github.com/exercism/abap/blob/main/docs/clone_04.png?raw=true)

### Offline Repository

Use this method if your system is *not* connected to the Internet.

1. Go to [https://github.com/exercism/abap](https://github.com/exercism/abap)
2. Download the repository ZIP file 

![abapGit Offline Repo](https://github.com/exercism/abap/blob/main/docs/clone_10.png?raw=true)

3. Run abapGit
4. On the "Repository Overview", select "New Offline"
5. Enter the following values
- Repository Name: `Exercism - ABAP Track`
- Package: `$exer`

![abapGit Offline Repo](https://github.com/exercism/abap/blob/main/docs/clone_11.png?raw=true)

6. Select "Create Offline Repository"

![abapGit Offline Repo](https://github.com/exercism/abap/blob/main/docs/clone_12.png?raw=true)

7. Select "Import ZIP" and pick the downloaded ZIP file. You should see a list of objects with status "A":

![abapGit Offline Repo](https://github.com/exercism/abap/blob/main/docs/clone_13.png?raw=true)

8. Select "Pull ZIP" to clone all objects to your system. Once completed you should see all objects with a blank status

![abapGit Offline Repo](https://github.com/exercism/abap/blob/main/docs/clone_14.png?raw=true)

## Uninstalling Exercism ABAP Track

You can remove all objects from your system in the following way:

1. Run abapGit
2. Go to the `Execism - ABAP Track` repository
3. Select "Advanced > Uninstall"
4. Confirm the deletion of all objects and the repository

## Troubleshooting

- In case of connection issues, check [SSL Setup](https://docs.abapgit.org/user-guide/setup/ssl-setup.html)
- In case of error `Package $EXERCISM_DIFFERENCE-OF-SQUARES exceeds ABAP 30-characters name limit`, please use a shorter package name like '$EXER`.
- Some files will show diffs after pulling into your ABAP system. These are related to different end-of-file and byte-order-characters and can be ignored.
  
