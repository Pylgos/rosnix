{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "cx_msgs";
  version = "0.1.2-1";
  src = finalAttrs.passthru.sources."cx_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rosidl-default-generators ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "cx_msgs" = substituteSource {
      src = fetchgit {
        name = "cx_msgs-source";
        url = "https://github.com/ros2-gbp/clips_executive-release.git";
        rev = "375e1fbbd98444941bac4e1b86b9ed4f18b7384e";
        hash = "sha256-pXgIj7K3a1BaZ5QaPE5o6SfGdG8z+heo4cPn7t+9U8M=";
      };
    };
  });
  meta = {
    description = "ROS interfaces for ROS2 CLIPS-Executive";
  };
})
