{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  octomap-server,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "octomap_mapping";
  version = "2.3.1-1";
  src = finalAttrs.passthru.sources."octomap_mapping";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ octomap-server ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ octomap-server ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "octomap_mapping" = substituteSource {
      src = fetchgit {
        name = "octomap_mapping-source";
        url = "https://github.com/ros2-gbp/octomap_mapping-release.git";
        rev = "a325c98039ff0ce67bca8359019f8e3d640d49a5";
        hash = "sha256-UWFkvOW/+kzKeLmCB2KVcoWjIvh7LBfbvkZ3y+/hlEg=";
      };
    };
  });
  meta = {
    description = "\n    Mapping tools to be used with the ";
  };
})
