import setuptools

class BinaryDistribution(setuptools.dist.Distribution):
    """Distribution which always forces a binary package with platform name"""
    def has_ext_modules(foo):
        return True


setuptools.setup(
    name="filebeat", # Replace with your own username
    version="0.0.1",
    author="devops@hyperscience.com",
    author_email="devops@hyperscience.com",
    description="light wrapper around filebeat to call in once mode",
    url="https://github.com/hyperscience/beats",
    packages=setuptools.find_packages(),
    classifiers=[
        "Programming Language :: Python :: 3",
    ],
    python_requires='>=3.7',
    distclass=BinaryDistribution,
)
