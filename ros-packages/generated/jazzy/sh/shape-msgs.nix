{
  ament-cmake,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "shape_msgs";
  version = "5.3.5-1";
  src = finalAttrs.passthru.sources."shape_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ geometry-msgs rosidl-default-runtime ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "shape_msgs" = substituteSource {
      src = fetchgit {
        name = "shape_msgs-source";
        url = "https://github.com/ros2-gbp/common_interfaces-release.git";
        rev = "79f7106056e38493dc72b9ab32567657a1b2bead";
        hash = "sha256-rs1GqK5oBr04xDLis20P/Ym2CrxVsS+UgNrnVCMDKb0=";
      };
    };
  });
  meta = {
    description = "A package containing some message definitions which describe geometric shapes.";
  };
})
