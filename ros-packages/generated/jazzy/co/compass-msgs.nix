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
  version = "0.1.1-1";
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
        rev = "05f78e11d74e58e59328128527bcc8015ab13712";
        hash = "sha256-RB9i/nTQeMDElZGN0n2bG1Bc2uEWQSi1mutBs4Zma2Y=";
      };
    };
  });
  meta = {
    description = "\n    ROS 2 port of compass_msgs — messages related to compass and azimuth.\n    Message definition identical to ctu-vras/compass for compatibility.\n  ";
  };
})
