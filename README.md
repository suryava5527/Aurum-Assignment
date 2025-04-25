# Assignment pdf file is available in Folder : "/Assignment-Requirement"

# This is solution of below assignment : 

Determine the default branch of the specified repository.
• Check if the following permissions are set on the default branch:
    o “Force Push” denied for everyone.
    o “Edit Policies” denied for everyone.
    o “Bypass policies when completing pull requests” denied for everyone.
    o “Bypass policies when pushing” denied for everyone.
• Check if the following policy is set on the default branch:
    o Minimum number of contributors set to 2.
    o Reset all approval votes (does not reset votes to reject or wait) when new changes are pushed.
• Set the permission and policy when each of the previous criteria has failed

• Deployment strategy

• Policy update with Temporary Edit access

# Main pipeline file is azure-pipelines.yml and rest of yml file is being called as template from main pipeline yml file