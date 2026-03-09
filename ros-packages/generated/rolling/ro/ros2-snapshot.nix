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
  version = "0.0.3-1";
  src = finalAttrs.passthru.sources."ros2_snapshot";
  propagatedNativeBuildInputs = [ ros2pkg ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "graphviz" "python3-pydantic" ]; };
  propagatedBuildInputs = [ ros2pkg ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "graphviz" "python3-pydantic" ]; };
  checkInputs = rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ros2_snapshot" = substituteSource {
      src = fetchgit {
        name = "ros2_snapshot-source";
        url = "https://github.com/ros2-gbp/ros2_snapshot-release.git";
        rev = "895e579f0dff81bcb13e3d9ea89aea4d3d3bb396";
        hash = "sha256-J/g7Vs+aP9QnW89kUTVnGF1KzNNN4ecyY0KFauj8KtA=";
      };
    };
  });
  meta = {
    description = "ROS2 Snapshot - contains workspace modeler and snapshot tools";
  };
})
