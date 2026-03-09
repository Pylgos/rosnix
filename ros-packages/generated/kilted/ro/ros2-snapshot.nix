{
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  ros2pkg,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "ros2_snapshot";
  version = "0.0.2-1";
  src = finalAttrs.passthru.sources."ros2_snapshot";
  propagatedNativeBuildInputs = [ ros2pkg ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "graphviz" "python3-pydantic" ]; };
  propagatedBuildInputs = [ ros2pkg ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "graphviz" "python3-pydantic" ]; };
  checkInputs = rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ros2_snapshot" = substituteSource {
      src = fetchgit {
        name = "ros2_snapshot-source";
        url = "https://github.com/ros2-gbp/ros2_snapshot-release.git";
        rev = "c9e60da77dae2119bce8ecacc1b0a4bbf3963724";
        hash = "sha256-WGI6XBM/HhQ15jY78UNImby8GiFe6YWdLeNWa9M0QfI=";
      };
    };
  });
  meta = {
    description = "ROS2 Snapshot - contains workspace modeler and snapshot tools";
  };
})
