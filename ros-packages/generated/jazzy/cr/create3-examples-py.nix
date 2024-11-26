{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  irobot-create-msgs,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "create3_examples_py";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."create3_examples_py";
  propagatedBuildInputs = [ geometry-msgs irobot-create-msgs rclpy ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "create3_examples_py" = substituteSource {
        src = fetchgit {
          name = "create3_examples_py-source";
          url = "https://github.com/ros2-gbp/create3_examples-release.git";
          rev = "73e32f23d1c658c5227bef87c0d39dfca91c1a5b";
          hash = "sha256-sv6ZSGFWEOacCaq7AgxXO/NtHIRUvJkBOshviWB1QoY=";
        };
      };
    });
  };
  meta = {
    description = "Python examples for interacting with the iRobot(R) Create(R) 3 Educational Robot";
  };
})
