# Write a Custom Module

In this section we go through the process of creating a custom TF module.  

## Excercise

Create a custom module in the [starter project](./start/) that generates a resource name based on the below convention.  Then edit the [starter project](./start/) so that all resource names are generated using the custom module.

## Naming Convention

`[app abbreviation][name][environment][region][type][3 random]`

### Module Inputs

- Application Abbreviation: abbreviation describing the application
- Descriptive name of the resource
- Environment: d, q, s, or p
- Region: AWS region the resource exists in (no dashes)
- Type: Resource type identifier (ec2, vpc, sg, lb, or “blank”)

### Module Output

- Calculated name that follows convention
