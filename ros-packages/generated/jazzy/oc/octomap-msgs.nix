{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "octomap_msgs";
  version = "2.0.1-1";
  src = finalAttrs.passthru.sources."octomap_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ geometry-msgs rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "octomap_msgs" = substituteSource {
      src = fetchgit {
        name = "octomap_msgs-source";
        url = "https://github.com/ros2-gbp/octomap_msgs-release.git";
        rev = "2cbe604e58e33fc6746ee43e5489967f0d746572";
        hash = "sha256-K+JsNe6XUHfZcd7C4bJTFo1CsVsdOSF/YNIshrKDaq0=";
      };
    };
  });
  meta = {
    description = "This package provides messages and serializations / conversion for the";
  };
})
