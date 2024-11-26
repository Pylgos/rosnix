{
  ament-copyright,
  ament-flake8,
  ament-index-python,
  ament-mypy,
  ament-pep257,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  osrf-pycommon,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "launch";
  version = "3.4.2-2";
  src = finalAttrs.passthru.sources."launch";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-importlib-metadata" "python3-lark-parser" "python3-yaml" ]; };
  propagatedBuildInputs = [ ament-index-python osrf-pycommon ];
  checkInputs = [ ament-copyright ament-flake8 ament-mypy ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "launch" = substituteSource {
        src = fetchgit {
          name = "launch-source";
          url = "https://github.com/ros2-gbp/launch-release.git";
          rev = "196ad94e0bdbb2865e27b660917f7d4a2e15cf72";
          hash = "sha256-4r3hs/NhnD3VtuC0Io5xDtYqSnhHjRcfJf8xpbEJKWk=";
        };
      };
    });
  };
  meta = {
    description = "The ROS launch tool.";
  };
})
