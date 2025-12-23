# mdaudiobook - Markdown to Audiobook Converter

[![Status: Production Ready](https://img.shields.io/badge/status-production%20ready-green.svg)](https://docs.ucli.tools)
[![License: Apache 2.0](https://img.shields.io/badge/license-Apache%202.0-blue.svg)](https://github.com/ucli-tools/mdaudiobook/blob/main/LICENSE)

`mdaudiobook` is a command-line tool that converts Markdown content into high-quality audiobooks and podcasts using advanced text-to-speech technology. It transforms written content into engaging audio experiences with natural-sounding narration.

## Overview

mdaudiobook bridges the gap between written content and audio consumption. Whether you want to create audiobooks from your documentation, convert blog posts to podcasts, or generate narrated tutorials, mdaudiobook provides professional-grade text-to-speech conversion with customizable voices and audio processing.

## Key Features

- **High-Quality TTS** - Natural-sounding voice synthesis
- **Multiple Voice Options** - Various voices and languages
- **Audio Processing** - Noise reduction and enhancement
- **Chapter Support** - Automatic chapter detection and navigation
- **Metadata Tagging** - ID3 tags for podcast compatibility
- **Batch Processing** - Convert multiple files at once
- **Customizable Output** - Adjust speed, pitch, and audio quality
- **Cross-Platform** - Works on Linux, macOS, and Windows

## Installation

### Via UCLI (Recommended)

```bash
# Install ucli tool manager first
curl -fsSL https://install.ucli.tools | bash

# Install mdaudiobook
ucli build mdaudiobook
```

### Manual Installation

```bash
# Clone and install
git clone https://github.com/ucli-tools/mdaudiobook.git
cd mdaudiobook
make install
```

## Prerequisites

### Required Software

- **Python 3.8+** - Runtime environment
- **TTS Engine** - eSpeak-ng, Festival, or cloud TTS services
- **Audio Processing** - FFmpeg for audio manipulation
- **Python Packages** - Automatically installed via pip

### Installation by Platform

#### Ubuntu/Debian
```bash
# Install system dependencies
sudo apt update
sudo apt install -y python3 python3-pip ffmpeg espeak-ng

# Install TTS engines (choose one or more)
sudo apt install -y festival festvox-us1  # Festival TTS
# OR
pip install pyttsx3  # Python TTS wrapper
```

#### macOS
```bash
# Install system dependencies
brew install python3 ffmpeg

# Install TTS
pip install pyttsx3
# OR use macOS built-in 'say' command
```

#### Windows
```bash
# Install Python from python.org
# Install FFmpeg from ffmpeg.org

# Install TTS engines
pip install pyttsx3
# OR install eSpeak: https://espeak.sourceforge.net/
```

## Usage

### Basic Conversion

#### Convert Markdown to Audiobook
```bash
mdaudiobook generate document.md
```

#### Specify Output File
```bash
mdaudiobook generate document.md audiobook.mp3
```

#### Convert with Custom Settings
```bash
mdaudiobook generate document.md \
  --voice female \
  --speed 1.2 \
  --output audiobook.wav
```

### Command-Line Options

#### Voice and Audio Settings
```bash
--voice VOICE          # Voice selection (male/female/child)
--language LANG        # Language code (en/us/fr/de)
--speed FACTOR         # Speech speed (0.5-2.0, default: 1.0)
--pitch SHIFT          # Voice pitch adjustment
--volume LEVEL         # Audio volume (0.0-1.0)
```

#### Output Configuration
```bash
--format FORMAT        # Output format (mp3/wav/flac)
--bitrate RATE         # Audio bitrate (64k/128k/320k)
--sample-rate RATE     # Sample rate (22050/44100)
--channels MODE        # Audio channels (mono/stereo)
```

#### Content Processing
```bash
--chapter-marker TEXT  # Chapter separation marker
--pause-duration SEC   # Pause between sections
--metadata TITLE      # Audiobook title metadata
--author NAME         # Author metadata
```

### Interactive Mode

Run without arguments for guided setup:
```bash
mdaudiobook
```

The interactive mode will prompt for:
- Input file selection
- Voice preferences
- Output format options
- Audio quality settings

## Content Processing

### Markdown Parsing

mdaudiobook intelligently processes Markdown content:

#### Headers Become Chapters
```markdown
# Chapter 1: Introduction
This is the first chapter content...

## Section 1.1: Background
More detailed content...

# Chapter 2: Main Content
Next chapter begins automatically...
```

#### Formatting Handling
- **Bold/Italic**: Emphasized speech delivery
- **Code blocks**: Announced as "code block" with contents
- **Lists**: Numbered items announced clearly
- **Links**: URLs read out phonetically
- **Tables**: Converted to descriptive text

#### Metadata Extraction
YAML frontmatter is used for audiobook metadata:
```yaml
---
title: "My Audiobook"
author: "Author Name"
description: "A great audiobook"
language: "en"
duration: "2h 30m"
---
```

## Voice and Audio Configuration

### Voice Selection

#### Built-in Voices
```bash
# List available voices
mdaudiobook voices

# Use specific voice
mdaudiobook generate doc.md --voice "Zira"  # Windows
mdaudiobook generate doc.md --voice "Alex"  # macOS
```

#### TTS Engine Configuration

**eSpeak-ng (Cross-platform):**
```bash
# Configure voice
mdaudiobook generate doc.md --voice espeak --language en-us
```

**Festival (Linux):**
```bash
# Use Festival with custom voice
mdaudiobook generate doc.md --tts-engine festival --voice us1
```

### Audio Enhancement

#### Quality Settings
```bash
# High-quality output
mdaudiobook generate doc.md \
  --format wav \
  --sample-rate 44100 \
  --bitrate 320k \
  --channels stereo
```

#### Noise Reduction
```bash
# Apply audio processing
mdaudiobook generate doc.md --denoise --normalize
```

## Advanced Features

### Batch Processing

#### Convert Multiple Files
```bash
# Convert all markdown files in directory
mdaudiobook batch-convert *.md --output-dir audiobooks/
```

#### Playlist Generation
```bash
# Create M3U playlist from multiple files
mdaudiobook generate *.md --playlist audiobook.m3u
```

### Podcast Integration

#### RSS Feed Generation
```bash
# Generate podcast RSS feed
mdaudiobook podcast-generate chapters/ \
  --title "My Podcast" \
  --description "Weekly episodes" \
  --feed-url "https://example.com/feed.xml"
```

#### Chapter Markers
```bash
# Add chapter markers for podcast apps
mdaudiobook generate book.md \
  --chapters \
  --chapter-file chapters.json
```

### Integration with Other Tools

#### Documentation Workflows
```bash
# Convert README to audio documentation
mdaudiobook generate README.md docs.mp3 \
  --voice female \
  --speed 0.9 \
  --metadata "Project Documentation"
```

#### Educational Content
```bash
# Create narrated tutorials
mdaudiobook generate tutorial.md tutorial.mp3 \
  --voice teacher \
  --pause-duration 0.5 \
  --chapter-marker "##"
```

## Customization

### Configuration Files

Create `~/.config/mdaudiobook/config.yaml`:

```yaml
# Default settings
voice: "female"
language: "en-us"
speed: 1.0
format: "mp3"
bitrate: "128k"
sample_rate: 44100

# TTS engine settings
tts_engine: "espeak"  # espeak, festival, pyttsx3, system
espeak:
  voice: "en-us"
  pitch: 50
  speed: 175

# Audio processing
denoise: true
normalize: true
pause_duration: 0.3
```

### Voice Profiles

Define custom voice profiles:

```yaml
voices:
  narrator:
    engine: "espeak"
    voice: "en-gb"
    speed: 0.9
    pitch: 60

  character:
    engine: "festival"
    voice: "us3"
    speed: 1.1
    pitch: 70
```

## Troubleshooting

### Common Issues

#### TTS Engine Not Found
```bash
# Check available TTS engines
mdaudiobook engines

# Install missing engines
# Ubuntu: sudo apt install espeak-ng festival
# macOS: brew install espeak
```

#### Audio Quality Issues
```bash
# Test audio output
mdaudiobook test-audio

# Check FFmpeg installation
ffmpeg -version
```

#### File Encoding Problems
```bash
# Ensure UTF-8 encoding
file document.md

# Convert encoding if needed
iconv -f latin1 -t utf8 document.md > document_utf8.md
```

#### Memory Issues with Large Files
```bash
# Process in chunks
mdaudiobook generate large-doc.md --chunk-size 1000

# Use streaming for very large files
mdaudiobook generate large-doc.md --stream
```

### Performance Optimization

#### Fast Processing
```bash
# Use faster TTS engine
mdaudiobook generate doc.md --tts-engine espeak --speed 2.0

# Reduce audio quality for speed
mdaudiobook generate doc.md --format mp3 --bitrate 64k
```

#### Parallel Processing
```bash
# Process multiple files simultaneously
mdaudiobook batch-convert *.md --parallel 4
```

### Debug Mode

Enable verbose output:
```bash
mdaudiobook generate --debug doc.md
```

## Examples

### Basic Audiobook Creation

```bash
# Simple conversion
mdaudiobook generate story.md audiobook.mp3

# With custom voice settings
mdaudiobook generate story.md \
  --voice female \
  --speed 0.9 \
  --language en-gb \
  audiobook.mp3
```

### Podcast Episode

```markdown
---
title: "Episode 1: Getting Started"
author: "Podcast Host"
description: "Introduction to our topic"
duration: "25m 30s"
---

# Welcome to Our Podcast

Hello and welcome to the first episode...

## Today's Topic

We'll be discussing...

## Key Points

- Point one: Important concept
- Point two: Another key idea
- Point three: Final thoughts
```

```bash
# Generate podcast episode
mdaudiobook generate episode1.md episode1.mp3 \
  --voice male \
  --speed 1.0 \
  --metadata "Podcast Name - Episode 1" \
  --author "Host Name"
```

### Documentation Narration

```bash
# Create narrated API documentation
mdaudiobook generate api-docs.md api-guide.mp3 \
  --voice neutral \
  --speed 0.8 \
  --chapters \
  --format mp3 \
  --bitrate 128k
```

### Educational Content

```bash
# Generate narrated lecture
mdaudiobook generate lecture.md lecture.mp3 \
  --voice professor \
  --pause-duration 0.7 \
  --chapter-marker "#" \
  --metadata "CS101 - Lecture 1"
```

## Integration Examples

### Documentation Pipeline

```bash
#!/bin/bash
# Automated documentation audio generation

# Generate API docs audio
mdaudiobook generate api.md api-docs.mp3 \
  --voice female \
  --speed 0.9 \
  --chapters

# Generate changelog audio
mdaudiobook generate CHANGELOG.md changelog.mp3 \
  --voice male \
  --speed 1.0

# Create playlist
echo "# Documentation Audio Guide" > docs.m3u
echo "api-docs.mp3" >> docs.m3u
echo "changelog.mp3" >> docs.m3u
```

### CI/CD Integration

#### GitHub Actions
```yaml
- name: Generate Documentation Audio
  run: |
    pip install mdaudiobook
    mdaudiobook generate README.md docs.mp3 \
      --voice female \
      --speed 0.9 \
      --metadata "Project Documentation"
- name: Upload Audio
  uses: actions/upload-artifact@v3
  with:
    name: documentation-audio
    path: docs.mp3
```

### Content Management System

```python
# Python script for automated audio generation
import subprocess
import os

def generate_audio(content_file, output_file, voice="female"):
    cmd = [
        "mdaudiobook", "generate",
        content_file,
        "--voice", voice,
        "--speed", "0.9",
        "--output", output_file
    ]
    subprocess.run(cmd, check=True)

# Generate audio for all blog posts
for md_file in os.listdir("posts/"):
    if md_file.endswith(".md"):
        audio_file = md_file.replace(".md", ".mp3")
        generate_audio(f"posts/{md_file}", f"audio/{audio_file}")
```

## Contributing

### Development Setup

```bash
# Clone repository
git clone https://github.com/ucli-tools/mdaudiobook.git
cd mdaudiobook

# Install development dependencies
pip install -r requirements-dev.txt

# Run tests
python -m pytest

# Install locally for testing
pip install -e .
```

### Adding TTS Engines

1. Create new TTS engine class in `mdaudiobook/engines/`
2. Implement the `TTSEngine` interface
3. Add configuration options
4. Update documentation

### Voice Development

Contribute new voice profiles by submitting PRs with:
- Voice configuration
- Audio samples
- Performance benchmarks

## Changelog

### Version 2.0.0
- Multiple TTS engine support
- Batch processing capabilities
- Podcast RSS generation
- Advanced audio processing

### Version 1.5.0
- Chapter detection and navigation
- Metadata tagging support
- Multiple output formats
- Voice customization options

### Version 1.0.0
- Initial release
- Basic Markdown to audio conversion
- Single TTS engine support
- Cross-platform compatibility

## Support

- **Documentation**: [docs.ucli.tools/tools/mdaudiobook](https://docs.ucli.tools/tools/mdaudiobook)
- **Issues**: [GitHub Issues](https://github.com/ucli-tools/mdaudiobook/issues)
- **Discussions**: [Community Forums](https://github.com/ucli-tools/community/discussions)

## License

Licensed under the Apache License 2.0. See [LICENSE](https://github.com/ucli-tools/mdaudiobook/blob/main/LICENSE) for details.

---

**Ready to turn text into speech?** Try `ucli build mdaudiobook` to get started!
