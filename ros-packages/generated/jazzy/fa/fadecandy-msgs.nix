{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "fadecandy_msgs";
  version = "1.0.2-2";
  src = finalAttrs.passthru.sources."fadecandy_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "fadecandy_msgs" = substituteSource {
      src = fetchgit {
        name = "fadecandy_msgs-source";
        url = "https://github.com/eurogroep/fadecandy_ros-release.git";
        rev = "659fed78a8b786fc99eb6b7ae7772ce22c97b4e8";
        hash = "sha256-q95L/EMyW9mbjvgyofhXQjx5ncfeNmIt7j6FRjXEg3o=";
      };
    };
  });
  meta = {
    description = "ROS msgs for fadecandy LED controllers";
  };
})
