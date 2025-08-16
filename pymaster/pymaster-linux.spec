# -*- mode: python ; coding: utf-8 -*-
"""
PyInstaller spec file for Quake 3 Master Server
Usage: pyinstaller pymaster.spec
"""

import sys
from PyInstaller.utils.hooks import collect_data_files, collect_submodules

block_cipher = None

# Define the main script
main_script = 'pymaster.py'

# Collect any data files if needed (currently none for this project)
datas = []

# Hidden imports - modules that PyInstaller might miss
hiddenimports = [
    'asyncio',
    'logging',
    'struct',
    'time',
    'dataclasses',
    'typing',
    'datetime',
    'argparse',
    'json',
    'socket',
]

# Optional: Add aiohttp if you want web API support
# Uncomment these lines if you have aiohttp installed and want it included
try:
    import aiohttp
    hiddenimports.extend([
        'aiohttp',
        'aiohttp.web',
        'aiohttp.web_response',
        'aiohttp.web_request',
        'aiohttp.web_runner',
        'multidict',
        'yarl',
        'async_timeout',
        'charset_normalizer'
    ])
    print("Including aiohttp for web API support")
except ImportError:
    print("aiohttp not found - web API will be disabled in binary")

# Binaries to exclude (reduce size)
excludes = [
    'tkinter',
    'matplotlib',
    'numpy',
    'pandas',
    'PIL',
    'PyQt5',
    'PyQt6',
    'PySide2',
    'PySide6',
    'wx',
    'scipy',
    'sklearn',
    'tensorflow',
    'torch',
    'cv2',
]

a = Analysis(
    [main_script],
    pathex=[],
    binaries=[],
    datas=datas,
    hiddenimports=hiddenimports,
    hookspath=[],
    hooksconfig={},
    runtime_hooks=[],
    excludes=excludes,
    win_no_prefer_redirects=False,
    win_private_assemblies=False,
    cipher=block_cipher,
    noarchive=False,
)

pyz = PYZ(a.pure, a.zipped_data, cipher=block_cipher)

exe = EXE(
    pyz,
    a.scripts,
    a.binaries,
    a.zipfiles,
    a.datas,
    [],
    name='q3master',
    debug=False,
    bootloader_ignore_signals=False,
    strip=False,
    upx=True,  # Enable UPX compression to reduce file size
    upx_exclude=[],
    runtime_tmpdir=None,
    console=True,  # Console application
    disable_windowed_traceback=False,
    target_arch=None,
    codesign_identity=None,
    entitlements_file=None,
    icon=None,  # Add path to .ico file if you have one
)

# Optional: Create a .tar.gz distribution
# Uncomment if you want a compressed archive
"""
coll = COLLECT(
    exe,
    a.binaries,
    a.zipfiles,
    a.datas,
    strip=False,
    upx=True,
    upx_exclude=[],
    name='q3master-linux'
)
"""