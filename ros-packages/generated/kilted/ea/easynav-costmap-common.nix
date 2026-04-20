{
  ament-cmake,
  ament-cmake-gtest,
  ament-index-cpp,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  easynav-common,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  nav-msgs,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "easynav_costmap_common";
  version = "0.3.1-1";
  src = finalAttrs.passthru.sources."easynav_costmap_common";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-index-cpp easynav-common nav-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-index-cpp easynav-common nav-msgs ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "easynav_costmap_common" = substituteSource {
      src = fetchgit {
        name = "easynav_costmap_common-source";
        url = "https://github.com/EasyNavigation/easynav_plugins-release.git";
        rev = "b8b063be8f97ad662d89983556cd0de597e13e8d";
        hash = "sha256-ldmf8MaH6ZguW0naN/+6Gt3rRdBvJQgFwRE+NZkVRBA=";
      };
    };
  });
  meta = {
    description = "Easy Navigation: Simple Common package.";
  };
})
