# Phoebus Artifact

Phoebus is a generic differential testing framework for uncovering security and functional bugs in web browsers.

This repository contains the artifact associated with the accompanying paper. It includes the Phoebus implementation, installation and usage documentation, claim-specific evaluation material, and supporting resources.

## Repository Structure

```text
.
├── artifact/
│   ├── configs/              Configuration files for Phoebus and individual test cases
│   ├── default-files/        Default and template files used to initialize and run test cases
│   ├── dockerfiles/apache/   Docker configuration for building Apache-based web server environments
│   ├── endpoint-scripts/     Server-side PHP scripts for collecting test results and reports
│   ├── scripts/              Installation and execution scripts
│   ├── use-cases/            Test cases, including templates, generated tests, and Selenium scripts
│   ├── utils/                Utility modules and supporting files used by Phoebus
│   ├── websockets/           WebSocket support code
│   ├── analyzer.py           Analyzes browser results, identifies inconsistencies, and generates reports
│   ├── downloader.py         Downloads browsers and their corresponding WebDrivers
│   ├── env-setup.py          Sets up the testing environment, including containers/servers and TLS certificates
│   ├── generator.py          Generates browser feature configurations
│   ├── testGenerator.py      Expands test templates into concrete test pages
│   ├── tester.py             Executes browser tests and collects their results
│   ├── requirements.txt      Python package dependencies required by Phoebus
│   ├── ...                   Rest of Phoebus source code and supporting resources
│   └── README.md             Detailed installation and usage instructions
│
├── claims/
│   ├── claim-1/              Material for demonstrating Claim 1 — Feature deployment generation
│   ├── claim-2/              Material for demonstrating Claim 2 — HTML test generation
│   └── claim-3/              Material for demonstrating Claim 3 — Differential testing and inconsistency analysis
│
├── install.sh                Top-level artifact installation script
├── use.txt                   Intended use and limitations
├── license.txt               GNU General Public License v3.0
└── README.md                 Repository overview and artifact navigation
```

## System Requirements

Phoebus is designed to run in a Linux environment. The artifact has been tested on **Ubuntu 22.04**.

The installation script automatically installs and configures the software dependencies required by Phoebus, including Python, Docker, Apache HTTP Server, and the required Python packages.

## Quick Start

Before installation, make sure that the artifact is being run in an Ubuntu environment. From the repository root, run:

```bash
./install.sh
```

The installation script invokes the artifact setup procedure and installs and configures the dependencies and services required by Phoebus.

After installation, follow the detailed instructions in [`artifact/README.md`](artifact/README.md) for using Phoebus. The artifact README provides a step-by-step example covering browser and WebDriver setup, test case creation and configuration, test generation, test execution, and result analysis.

## Artifact Claims

The `claims/` directory contains the scripts and expected outputs associated with the claims described in the artifact metadata.

The current claims concern the following capabilities:

1. **Feature deployment generation.**
   Phoebus can systematically generate browser feature deployments from high-level feature descriptions, including configurations covering common and edge-case feature values.

2. **HTML test generation.**
   Phoebus can expand user-defined HTML test templates into fully fledged test pages.

3. **Differential testing and inconsistency analysis.**
   Phoebus can automatically execute generated tests across browsers, identify behavioral inconsistencies, and cluster the resulting inconsistencies to facilitate root-cause analysis.

Instructions for executing each claim demonstration are provided in the corresponding subdirectory of `claims/`.

## Detailed Documentation

The main Phoebus implementation and its detailed usage documentation are located in [`artifact/`](artifact/).

The [`artifact/README.md`](artifact/README.md) provides detailed installation and usage instructions, including browser and WebDriver setup, test generation, test execution, and result analysis.

