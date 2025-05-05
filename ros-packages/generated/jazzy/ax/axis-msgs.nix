{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildCatkinPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  substituteSource,
}:
buildCatkinPackage (finalAttrs: {
  pname = "axis_msgs";
  version = "3.0.1-1";
  src = finalAttrs.passthru.sources."axis_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators rosidl-default-runtime ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rosidl-default-generators rosidl-default-runtime ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "axis_msgs" = substituteSource {
      src = fetchgit {
        name = "axis_msgs-source";
        url = "https://github.com/clearpath-gbp/axis_camera-release.git";
        rev = "2e8bcb00b2e3f6063e8bf310eb9e433172d84489";
        hash = "sha256-S4dmx+VBi+qBSgvqbsXPK8W7SOSC+50P2QYVlQEGFqE=";
      };
    };
  });
  meta = {
    description = "\n    ROS messages used by the axis_camera package to control Axis PTZ and fixed cameras\n  ";
  };
})
