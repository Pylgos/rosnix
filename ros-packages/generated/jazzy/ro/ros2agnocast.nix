{
  agnocast-ioctl-wrapper,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "ros2agnocast";
  version = "2.3.3-1";
  src = finalAttrs.passthru.sources."ros2agnocast";
  propagatedNativeBuildInputs = [ agnocast-ioctl-wrapper ];
  propagatedBuildInputs = [ agnocast-ioctl-wrapper ];
  passthru.sources = mkSourceSet (sources: {
    "ros2agnocast" = substituteSource {
      src = fetchgit {
        name = "ros2agnocast-source";
        url = "https://github.com/ros2-gbp/agnocast-release.git";
        rev = "f2af222d15eb90742dba20241ad108775ae2c628";
        hash = "sha256-AcjpjGzO45WJeqqdxpI/YVcKVJqWkBRE8KTMh3cgePs=";
      };
    };
  });
  meta = {
    description = "\n    The ROS 2 command line tool extension for Agnocast.\n  ";
  };
})
