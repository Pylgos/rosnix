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
  version = "3.0.2-1";
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
        rev = "3a0025fcca7f4a5e92fd1941c6d3118606f37c67";
        hash = "sha256-kC+fVNACZQTg8YAi4PlWTV0u7n1N+rL2U3ubhvfhJSo=";
      };
    };
  });
  meta = {
    description = "\n    ROS messages used by the axis_camera package to control Axis PTZ and fixed cameras\n  ";
  };
})
