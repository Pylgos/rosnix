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
  version = "0.2.2-1";
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
        rev = "bf1953e407bbbe89bf5b7acaa304afd247d1e45b";
        hash = "sha256-W/wyvTuVfcIHYXXDKhl9+XkdGM1Ilqy1SHOi2EtBnPU=";
      };
    };
  });
  meta = {
    description = "\n    ROS 2 port of compass_msgs: messages related to compass and azimuth.\n    Message definition identical to ctu-vras/compass for compatibility.\n  ";
  };
})
