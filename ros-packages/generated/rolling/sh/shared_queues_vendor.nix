{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    ef7dfbf553288064347d51b8ac335f1ca489032a-vendor_source-1r7gpxhzr9sw3n8lgivv7jigi802scp53n3aig1pymp271r7bwdm = substituteSource {
      src = fetchzip {
        name = "ef7dfbf553288064347d51b8ac335f1ca489032a-vendor_source-1r7gpxhzr9sw3n8lgivv7jigi802scp53n3aig1pymp271r7bwdm-source";
        url = "https://github.com/cameron314/readerwriterqueue/archive/ef7dfbf553288064347d51b8ac335f1ca489032a.zip";
        hash = "sha256-tfF1cjjiVn/Di2rYUS7TAqD4ojx7x0eRHVyn/GG/7+Q=";
      };
      substitutions = [
      ];
    };
    shared_queues_vendor-5bfdbc60c3ab76b8308362830dd9aaa3fc7cb7e0 = substituteSource {
      src = fetchgit {
        name = "shared_queues_vendor-5bfdbc60c3ab76b8308362830dd9aaa3fc7cb7e0-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "5bfdbc60c3ab76b8308362830dd9aaa3fc7cb7e0";
        hash = "sha256-1Jz+rLYhCEk7DLVDD6024TMbRbGI5W6GChosnvU6vHA=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "URL https://github.com/cameron314/readerwriterqueue/archive/ef7dfbf553288064347d51b8ac335f1ca489032a.zip";
          to = "URL ${ef7dfbf553288064347d51b8ac335f1ca489032a-vendor_source-1r7gpxhzr9sw3n8lgivv7jigi802scp53n3aig1pymp271r7bwdm}";
        }
      ];
    };
  };
in
buildRosPackage {
  pname = "shared_queues_vendor";
  version = "0.29.0-1";
  src = sources.shared_queues_vendor-5bfdbc60c3ab76b8308362830dd9aaa3fc7cb7e0;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Vendor package for concurrent queues from moodycamel";
  };
}
