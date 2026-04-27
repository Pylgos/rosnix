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
  pname = "compass_msgs";
  version = "0.2.0-1";
  src = finalAttrs.passthru.sources."compass_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "compass_msgs" = substituteSource {
      src = fetchgit {
        name = "compass_msgs-source";
        url = "https://github.com/manankharwar/fusioncore-release.git";
        rev = "f8e554001e01ff39aa4e85ea87272b8c919b532e";
        hash = "sha256-DLZgIPYFe5kY5unm7vKZO/rvw5mB9fYGxXkuIoYwqeI=";
      };
    };
  });
  meta = {
    description = "\n    ROS 2 port of compass_msgs: messages related to compass and azimuth.\n    Message definition identical to ctu-vras/compass for compatibility.\n  ";
  };
})
