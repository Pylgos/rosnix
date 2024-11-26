{
  ament-cmake-flake8,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  joy,
  launch-ros,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  teleop-twist-joy,
  teleop-twist-keyboard,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "create3_teleop";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."create3_teleop";
  propagatedBuildInputs = [ joy launch-ros teleop-twist-joy teleop-twist-keyboard ];
  checkInputs = [ ament-cmake-flake8 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "create3_teleop" = substituteSource {
        src = fetchgit {
          name = "create3_teleop-source";
          url = "https://github.com/ros2-gbp/create3_examples-release.git";
          rev = "a59baea876c21be4af591e0d1ff5f6856948fc2b";
          hash = "sha256-wh6eHc0upIMPULB+GGnz+JeQCv7lSIgfxur8trKSueE=";
        };
      };
    });
  };
  meta = {
    description = "Example launch files for teleoperating the iRobot(R) Create(R) 3 Educational Robot.";
  };
})
