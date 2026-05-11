{
  ament-cmake-auto,
  ament-lint-auto,
  autoware-cmake,
  autoware-lint-common,
  autoware-simple-pure-pursuit,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_core_control";
  version = "1.8.0-1";
  src = finalAttrs.passthru.sources."autoware_core_control";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedNativeBuildInputs = [ autoware-simple-pure-pursuit ];
  buildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedBuildInputs = [ autoware-simple-pure-pursuit ];
  checkInputs = [ ament-lint-auto autoware-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_core_control" = substituteSource {
      src = fetchgit {
        name = "autoware_core_control-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "d066f94a93231802083aef932c4d6cd960e05b9c";
        hash = "sha256-K6Z0dhzyGXXiYA+M/ckDwT7RfE2Ll6mDvL1bHFHmNKY=";
      };
    };
  });
  meta = {
    description = "The autoware_core_control package";
  };
})
