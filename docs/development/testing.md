# Testing UCLI Tools

This guide covers the testing strategies, frameworks, and best practices used across the UCLI Tools ecosystem. Comprehensive testing ensures reliability, prevents regressions, and maintains high code quality.

## 🧪 Testing Philosophy

### Quality Assurance Principles

- **Test-Driven Development**: Write tests before or alongside code
- **Continuous Integration**: Automated testing on every change
- **Cross-Platform Validation**: Test on all supported platforms
- **Performance Monitoring**: Track test execution and coverage
- **User-Centric Testing**: Test from user's perspective

### Testing Pyramid

```
End-to-End Tests (E2E)
    ├── Integration Tests
        ├── Component Tests
            └── Unit Tests
```

#### Unit Tests (Foundation)
- Test individual functions and modules
- Fast execution, isolated from dependencies
- High coverage target: 80%+

#### Integration Tests (Middle Layer)
- Test component interactions
- Validate data flow between modules
- Use real dependencies where possible

#### End-to-End Tests (Top Layer)
- Test complete user workflows
- Validate user experience
- Use staging/production-like environments

## 🛠️ Testing Frameworks

### Bash Tools (ucli, gits)

#### bats-core Framework
```bash
# Install bats
brew install bats-core  # macOS
npm install -g bats     # Alternative

# Run tests
bats tests/

# Run specific test
bats tests/unit/test_cli.bats
```

#### Example Test Structure
```bash
# tests/unit/test_cli.bats
#!/usr/bin/env bats

setup() {
    # Setup code runs before each test
    TEST_DIR="$(mktemp -d)"
    cd "$TEST_DIR"
}

teardown() {
    # Cleanup code runs after each test
    cd "$BATS_TEST_DIRNAME"
    rm -rf "$TEST_DIR"
}

@test "shows help message" {
    run tool-name --help
    [ "$status" -eq 0 ]
    [[ "$output" =~ "Usage:" ]]
}

@test "handles missing arguments" {
    run tool-name
    [ "$status" -eq 1 ]
    [[ "$output" =~ "Error:" ]]
}
```

### Python Tools (mdaudiobook)

#### pytest Framework
```bash
# Install pytest
pip install pytest pytest-cov pytest-mock

# Run tests
pytest

# Run with coverage
pytest --cov=src --cov-report=html

# Run specific tests
pytest tests/test_cli.py -v
```

#### Example Test Structure
```python
# tests/test_cli.py
import pytest
from unittest.mock import patch, MagicMock
from mdaudiobook.cli import main

class TestCLI:
    def test_help_option(self):
        """Test help option displays correctly."""
        with patch('sys.argv', ['mdaudiobook', '--help']):
            with patch('sys.stdout') as mock_stdout:
                with pytest.raises(SystemExit) as excinfo:
                    main()
                assert excinfo.value.code == 0

    def test_generate_command(self):
        """Test generate command with valid input."""
        with patch('mdaudiobook.core.AudioGenerator') as mock_gen:
            mock_instance = MagicMock()
            mock_gen.return_value = mock_instance

            with patch('sys.argv', ['mdaudiobook', 'generate', 'test.md']):
                result = main()
                assert result == 0
                mock_instance.generate.assert_called_once()

    @pytest.mark.parametrize("invalid_file", [
        "nonexistent.md",
        "",
        None
    ])
    def test_invalid_input_files(self, invalid_file):
        """Test handling of invalid input files."""
        with patch('sys.argv', ['mdaudiobook', 'generate', invalid_file]):
            result = main()
            assert result != 0
```

### Hybrid Tools (mdtexpdf)

#### Combined Testing Approach
```bash
# Unit tests for Bash components
bats tests/bash/

# Integration tests for Pandoc/LaTeX pipeline
pytest tests/integration/

# End-to-end document generation tests
./tests/e2e/test_document_generation.sh
```

## 🚀 Test Automation

### CI/CD Integration

#### GitHub Actions Testing Workflow
```yaml
# .github/workflows/test.yml
name: Test
on: [push, pull_request]

jobs:
  test:
    strategy:
      matrix:
        os: [ubuntu-latest, macos-latest, windows-latest]
        python-version: ['3.8', '3.9', '3.10']

    runs-on: ${{ matrix.os }}

    steps:
      - uses: actions/checkout@v4

      - name: Setup Python
        uses: actions/setup-python@v4
        with:
          python-version: ${{ matrix.python-version }}

      - name: Install dependencies
        run: |
          pip install -r requirements-dev.txt

      - name: Run tests
        run: |
          make test

      - name: Upload coverage
        uses: codecov/codecov-action@v3
        with:
          file: ./coverage.xml
```

### Local Test Execution

#### Makefile Test Targets
```makefile
.PHONY: test test-unit test-integration test-e2e test-coverage

# Run all tests
test: test-unit test-integration test-e2e

# Unit tests
test-unit:
	pytest tests/unit/ -v

# Integration tests
test-integration:
	pytest tests/integration/ -v

# End-to-end tests
test-e2e:
	bash tests/e2e/run_tests.sh

# Coverage report
test-coverage:
	pytest --cov=src --cov-report=html --cov-report=term
```

#### Test Environment Setup
```bash
# Create test environment
make test-env

# Run tests in isolation
make test-isolated

# Clean test artifacts
make test-clean
```

## 📊 Test Metrics and Reporting

### Coverage Requirements

#### Minimum Coverage Targets
- **Unit Tests**: 80% line coverage, 70% branch coverage
- **Integration Tests**: 60% line coverage
- **Overall Project**: 75% combined coverage

#### Coverage Reporting
```bash
# Generate HTML coverage report
pytest --cov=src --cov-report=html
open htmlcov/index.html

# Generate XML for CI
pytest --cov=src --cov-report=xml

# Coverage badge for README
pytest --cov=src --cov-report=term-missing | tail -1
```

### Performance Benchmarks

#### Test Execution Time
```bash
# Time test execution
time make test

# Profile slow tests
pytest --durations=10

# Parallel test execution
pytest -n auto
```

#### Resource Usage
```bash
# Memory usage monitoring
pytest --memray

# CPU profiling
pytest --profile
```

## 🐛 Test Categories and Patterns

### Unit Test Patterns

#### Function Testing
```python
def test_calculate_duration():
    """Test duration calculation from text length."""
    # Arrange
    text = "Hello world"
    wpm = 200

    # Act
    duration = calculate_duration(text, wpm)

    # Assert
    assert duration == 1.5  # 2 words / 200 wpm * 60 = 1.5 seconds
```

#### Error Handling
```python
def test_invalid_file_extension():
    """Test handling of unsupported file formats."""
    with pytest.raises(ValueError, match="Unsupported file format"):
        process_file("document.txt")
```

#### Mocking External Dependencies
```python
@patch('subprocess.run')
def test_external_command_execution(mock_run):
    """Test execution of external commands."""
    mock_run.return_value = MagicMock(returncode=0)

    result = run_external_command(['echo', 'hello'])

    assert result == 0
    mock_run.assert_called_once_with(['echo', 'hello'])
```

### Integration Test Patterns

#### API Integration
```python
def test_github_api_integration():
    """Test integration with GitHub API."""
    # Use VCR.py or similar for API mocking
    with vcr.VCR().use_cassette('github_api.yaml'):
        client = GitHubClient(token='fake-token')
        repos = client.get_user_repos('octocat')

        assert len(repos) > 0
        assert 'name' in repos[0]
```

#### File System Operations
```python
def test_file_processing_pipeline(tmp_path):
    """Test complete file processing workflow."""
    # Create test file
    test_file = tmp_path / "test.md"
    test_file.write_text("# Test Document\n\nContent here.")

    # Process file
    processor = DocumentProcessor()
    result = processor.process(test_file)

    # Verify output
    assert result.success
    assert result.output_file.exists()
```

### End-to-End Test Patterns

#### Complete Workflow Testing
```bash
# tests/e2e/test_full_workflow.sh
#!/bin/bash

set -e

# Setup test environment
TEST_DIR=$(mktemp -d)
cd "$TEST_DIR"

# Create test content
echo "# Test Document" > test.md
echo "This is a test document for E2E testing." >> test.md

# Test full workflow
echo "Testing full workflow..."

# Generate audio
mdaudiobook generate test.md --voice female --speed 1.5

# Verify output exists
if [ ! -f "test.mp3" ]; then
    echo "ERROR: Output file not created"
    exit 1
fi

# Verify audio properties
duration=$(ffprobe -i test.mp3 -show_entries format=duration -v quiet -of csv="p=0")
if (( $(echo "$duration < 1" | bc -l) )); then
    echo "ERROR: Audio too short"
    exit 1
fi

echo "SUCCESS: Full workflow test passed"

# Cleanup
cd - > /dev/null
rm -rf "$TEST_DIR"
```

## 🔧 Testing Tools and Utilities

### Test Data Management

#### Fixtures and Test Data
```python
# tests/conftest.py
import pytest
from pathlib import Path

@pytest.fixture
def sample_markdown():
    """Provide sample markdown content."""
    return """
# Sample Document

This is a sample document for testing.

## Section 1

Some content here.

## Section 2

More content.
"""

@pytest.fixture
def temp_file(tmp_path, sample_markdown):
    """Create temporary file with sample content."""
    file_path = tmp_path / "sample.md"
    file_path.write_text(sample_markdown)
    return file_path
```

#### Mock Services
```python
# tests/mocks.py
class MockTTSService:
    """Mock TTS service for testing."""

    def __init__(self):
        self.call_count = 0
        self.last_text = None

    def synthesize(self, text, voice='default'):
        self.call_count += 1
        self.last_text = text
        # Return mock audio data
        return b'mock_audio_data'

@pytest.fixture
def mock_tts():
    """Provide mock TTS service."""
    return MockTTSService()
```

### Test Utilities

#### Custom Assertions
```python
# tests/utils.py
def assert_audio_file_valid(file_path):
    """Assert that audio file is valid."""
    assert file_path.exists(), f"Audio file {file_path} does not exist"

    # Check file size
    size = file_path.stat().st_size
    assert size > 1000, f"Audio file too small: {size} bytes"

    # Check file format (basic)
    with open(file_path, 'rb') as f:
        header = f.read(12)
        assert header.startswith(b'ID3') or header.startswith(b'\xff\xfb'), \
            "Invalid audio file format"

def assert_markdown_processed(input_text, output_audio):
    """Assert markdown was properly converted to audio."""
    # Count headings in input
    heading_count = input_text.count('\n#')

    # Audio should be longer for more content
    duration = get_audio_duration(output_audio)
    min_duration = heading_count * 2  # Rough estimate
    assert duration >= min_duration, \
        f"Audio too short for content: {duration}s < {min_duration}s"
```

## 📈 Continuous Testing

### Pre-commit Hooks
```bash
# .pre-commit-config.yaml
repos:
  - repo: local
    hooks:
      - id: test
        name: Run tests
        entry: make test-unit
        language: system
        pass_filenames: false

  - repo: https://github.com/pre-commit/pre-commit-hooks
    rev: v4.4.0
    hooks:
      - id: trailing-whitespace
      - id: end-of-file-fixer
      - id: check-yaml
      - id: check-added-large-files
```

### Automated Testing Schedule

#### Pull Request Checks
- **Unit Tests**: Run on every PR
- **Integration Tests**: Run on every PR
- **Linting**: Code style and formatting
- **Security Scanning**: Vulnerability checks

#### Nightly Builds
- **Full Test Suite**: All tests on main branch
- **Performance Tests**: Benchmark comparisons
- **Compatibility Tests**: Multiple platform validation

#### Release Testing
- **Staging Environment**: Full E2E testing
- **Load Testing**: Performance under stress
- **Rollback Testing**: Failure scenario validation

## 🎯 Best Practices

### Writing Effective Tests

#### Test Naming
```python
# Good: descriptive and specific
def test_calculate_duration_with_standard_wpm():
def test_generate_fails_with_invalid_voice():

# Bad: vague or implementation-focused
def test_function():
def test_calculate():
```

#### Test Isolation
```python
# Good: each test is independent
def test_feature_a():
    setup_isolated_environment()
    # test feature A

def test_feature_b():
    setup_isolated_environment()
    # test feature B

# Bad: tests depend on each other
def test_combined_features():
    # test A, then B, then C
```

#### Test Maintenance
- **Keep Tests Simple**: Complex tests are hard to maintain
- **Avoid Magic Numbers**: Use named constants
- **Document Test Purpose**: Clear docstrings
- **Regular Review**: Update tests as code evolves

### Performance Testing

#### Benchmarking
```python
import time
import pytest

def test_performance_baseline(benchmark):
    """Benchmark core functionality."""
    def run_operation():
        # Your operation here
        process_large_document()

    result = benchmark(run_operation)

    # Assert performance requirements
    assert result.stats.mean < 1.0  # Less than 1 second average
```

#### Memory Testing
```python
def test_memory_usage():
    """Test memory usage for large files."""
    import psutil
    import os

    process = psutil.Process(os.getpid())
    initial_memory = process.memory_info().rss

    # Perform memory-intensive operation
    process_large_file()

    final_memory = process.memory_info().rss
    memory_increase = final_memory - initial_memory

    # Assert reasonable memory usage
    assert memory_increase < 100 * 1024 * 1024  # Less than 100MB increase
```

## 📊 Test Reporting and Analytics

### Test Results Dashboard

#### Coverage Trends
- Track coverage over time
- Identify decreasing coverage
- Set coverage goals by component

#### Failure Analysis
- Most frequent test failures
- Platform-specific issues
- Performance regressions

### Quality Metrics

#### Code Quality Gates
- **Coverage**: Minimum 75% overall
- **Complexity**: Maximum cyclomatic complexity
- **Duplication**: Less than 5% duplicate code
- **Technical Debt**: Regular assessment

#### Process Metrics
- **Test Execution Time**: Keep under 10 minutes
- **Flakiness Rate**: Less than 1% flaky tests
- **Debugging Time**: Average time to fix failing tests

This comprehensive testing strategy ensures UCLI Tools maintain high quality, reliability, and user trust across all supported platforms and use cases.
