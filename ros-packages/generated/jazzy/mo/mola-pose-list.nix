{
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  mola-common,
  mrpt-libmaps,
  mrpt-libposes,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "mola_pose_list";
  version = "1.2.1-1";
  src = finalAttrs.passthru.sources."mola_pose_list";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ mola-common mrpt-libmaps mrpt-libposes ];
  passthru = {
    sources = mkSourceSet (sources: {
      "mola_pose_list" = substituteSource {
        src = fetchgit {
          name = "mola_pose_list-source";
          url = "https://github.com/ros2-gbp/mola-release.git";
          rev = "6b4121df702d5d049a2f84877e6b0c85af97af65";
          hash = "sha256-Ls7v5G542KJAgDq3X2twg8UdtnCJYF178cG0HZQqaQ4=";
        };
      };
    });
  };
  meta = {
    description = "C++ library for searchable pose lists";
  };
})
