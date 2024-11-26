{
  ament-copyright,
  ament-flake8,
  ament-index-python,
  ament-pep257,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  mkSourceSet,
  osrf-pycommon,
  rclpy,
  rosSystemPackages,
  substituteSource,
  system-modes-msgs,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "launch_system_modes";
  version = "0.9.0-6";
  src = finalAttrs.passthru.sources."launch_system_modes";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-importlib-metadata" "python3-yaml" ]; };
  propagatedBuildInputs = [ ament-index-python launch osrf-pycommon rclpy system-modes-msgs ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "launch_system_modes" = substituteSource {
        src = fetchgit {
          name = "launch_system_modes-source";
          url = "https://github.com/ros2-gbp/system_modes-release.git";
          rev = "a08a9c8c80eee8713a7f490c95cd4db75d3f1805";
          hash = "sha256-igv7EQutLOf+qcExGB554hDDTuFxB1P9COvQUY2izGA=";
        };
      };
    });
  };
  meta = {
    description = "System modes specific extensions to the launch tool, i.e. launch actions, events, and event handlers for system modes.";
  };
})
