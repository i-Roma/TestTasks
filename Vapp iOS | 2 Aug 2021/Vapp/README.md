# Vapp iOS README #

Hello! In the app you'll find some commented out lines. I left them as an example of how
things could be solved if we need do navigation or passing data between scenes. Also it may seems the Presenter just repeat the same as an Scene's Interfes, but if the app will grow it will have place (in Presenter) to work with already recevied data, convert its data to
kind of ViewModel to present on view already boilerplated data

## The app architecture

Clean Swift (VIP)

## License

  Nest is [MIT licensed](LICENSE).

## Branching strategy

> We need to be able to work with the code so that the development process is continuous and flexible, and takes into account the development schedule and Sprint Schedule. Also, there is a need to keep clean code in master branch, avoid any blockers for pushing changes into the develop branch related to release process or code freeze, keep git history straight.

##### Keep your branch strategy simple. Build your strategy from these four concepts:
- Use feature branches for all new features and bug fixes
- Merge feature branches into the develop branch using pull requests with squash commits.
- Make releases though release branch
- Sync develop with master using pull requests with fast-forward

##### Use feature branches for your work
- Name your feature branches by convention
- Use a consistent naming convention for your feature branches to identify the work done in the branch. 
- Some suggestions for naming your feature branches:
    - fix/taskId-description
    - feature/taskId-description
    - feature/taskId-description/child-taskId-description
    - hotfix/taskId-description

##### Flow
- Develop your features and fix bugs in feature branches based off your develop branch
- Feature branches isolate work in progress from the completed work in the develop branch
- Even small fixes and changes should have their own feature branch

##### Splitting work under the one feature:
Sometimes large features can not be logically split to the small pieces and implementation should be shared between a few developers. For this specific case create the main feature branch add necessary common changes and then create branches off main feature branch.


