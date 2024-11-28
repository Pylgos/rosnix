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
  version = "3.0.0-1";
  src = finalAttrs.passthru.sources."axis_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "axis_msgs" = substituteSource {
      src = fetchgit {
        name = "axis_msgs-source";
        url = "https://github.com/clearpath-gbp/axis_camera-release.git";
        rev = "4ef9363e5a83d6d906972378bf4ec697974e28ed";
        hash = "sha256-aMoX6UegwrmP8+VmQIU0D1U1ibnZ2oSWRdqz9ISSCZo=";
      };
    };
  });
  meta = {
    description = "ROS messages used by the axis_camera package to control Axis PTZ and fixed cameras";
  };
})
