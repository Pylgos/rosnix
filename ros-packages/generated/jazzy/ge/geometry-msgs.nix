{
  ament-cmake,
  ament-lint-common,
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
  pname = "geometry_msgs";
  version = "5.3.5-1";
  src = finalAttrs.passthru.sources."geometry_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "geometry_msgs" = substituteSource {
        src = fetchgit {
          name = "geometry_msgs-source";
          url = "https://github.com/ros2-gbp/common_interfaces-release.git";
          rev = "9b595e5a5c793cc02c430a4fcc8c4cda4eef3725";
          hash = "sha256-tnsz8Gchh0hrKtLOTi//KLdKxmJrnhMGrJRz1PbBvxw=";
        };
      };
    });
  };
  meta = {
    description = "A package containing some geometry related message definitions.";
  };
})
