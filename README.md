# Advent of Code - Ruby Practice Repository

Welcome to my **Advent of Code** repository! This project is dedicated to solving Advent of Code problems using **Ruby** while building a foundation for **backend development** with **Rails**.

## Purpose
The primary goal of this repository is to:
- Sharpen my **Ruby programming skills** by tackling algorithmic challenges.
- Learn and practice **Ruby best practices** to prepare for working in **Rails backend development**.
- Improve my **testing skills** using **RSpec**, a widely-used testing framework in the Ruby and Rails ecosystem.

## Project Structure
This repository is structured in a way that mimics a small Ruby backend project, laying the groundwork for transitioning into Rails development later on:

```
advent_of_code_ruby/
│
├── Gemfile         # Dependency management
├── README.md       # This file
│
├── lib/            # Core logic for each day's challenge
│   └── advent_of_code/
│       └── dayX.rb # Solution classes for each day
│
├── bin/            # Executable scripts to run solutions
│   └── solve_dayX
│
└── spec/           # Tests for each day's solution
    └── dayX_spec.rb
```

## How to Run
1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/advent_of_code_ruby.git
   cd advent_of_code_ruby
   ```

2. Install dependencies:
   ```bash
   bundle install
   ```

3. Execute a specific day’s solution:
   ```bash
   ./bin/solve_day1
   ```

Input files for each day can be placed in an `input/` directory (e.g., `input/day1.txt`).

## Testing
This project uses **RSpec** for testing:
```bash
bundle exec rspec
```

## Key Learning Goals
- **Ruby Fundamentals**: Classes, modules, file I/O, enumerable methods.
- **Object-Oriented Design**: Clean, modular code.
- **Testing with RSpec**: Writing unit tests for logic validation.
- **Project Organization**: Structuring a Ruby project similar to Rails backend applications.

## Future Plans
- Expand the repository with more Advent of Code solutions.
- Introduce **Rails** to build small API wrappers around some problem solutions.
- Experiment with **Ruby gems** and **ActiveSupport utilities**.

## Resources
- [Ruby Documentation](https://ruby-doc.org/)
- [RSpec Documentation](https://rspec.info/)
- [Advent of Code](https://adventofcode.com/)

---
**Happy Coding! 🚀**


