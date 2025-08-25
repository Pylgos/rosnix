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
  pname = "nav_2d_msgs";
  version = "1.3.8-1";
  src = finalAttrs.passthru.sources."nav_2d_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ geometry-msgs rosidl-default-generators rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs rosidl-default-generators rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "nav_2d_msgs" = substituteSource {
      src = fetchgit {
        name = "nav_2d_msgs-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "8a92c374a1a24822bd1c4e13326cd7f9778db6e1";
        hash = "sha256-o0piva6wbXgTHWry3+y/WfXjh/aNIG6H0mUBpq8zpV4=";
      };
    };
  });
  meta = {
    description = "Basic message types for two dimensional navigation, extending from geometry_msgs::Pose2D.";
  };
})
